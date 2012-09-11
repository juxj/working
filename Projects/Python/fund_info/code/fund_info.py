import urllib
import struct
import os
import os.path
import sys
import string
import time
from HTMLParser import HTMLParser
import json
import shutil
import datetime
from datetime import timedelta
from utils import *
import threading
#import MySQLdb
import ConfigParser

global is_initial
global run_date
global day_offset 
global file_path
global thread_count
global fund_type_count
global server_addr
global show_url
#urls for fetch
global fund_url_base
global fund_url_daily
global fund_url_history

#global web_fetcher
global adapter

global config

def mkdir():
	os.mkdir(file_path)
	os.mkdir(file_path + '/data')
	os.mkdir(file_path + '/data/base_info')
	os.mkdir(file_path + '/data/history')
	os.mkdir(file_path + '/sql')

class AppConfig:
    def __init__(self):
        self.config = {}

    def load_config(self):
        config = ConfigParser.RawConfigParser()
        config.read('../config/config.ini')
        return config

class DailyFetcher:
	def run(self):
	
		web_fetcher = WebFetcher(server_addr)
		i = 1 # types of all funds
		result = []
		while i <= fund_type_count:
			url = fund_url_daily + 'date=' + run_date +'&type=' + str(i)
			html = web_fetcher.run(url, '', show_url)		
			html = json.loads(html)
			items = html['data']
			m = 0
			for item in items:
				m = m+1
				result.append('{\"fund_code\":\"'+item['fundCode']+'\", \"fund_name\":\"'+item['fundName']+'\"}')
			print 'Type:',i,':', m
			i = i + 1
		return result

class FundInfo:
	def run(self):
		daily = DailyFetcher()
		fund_items = daily.run()
		if len(fund_items)>0:
			print 'total funds:', len(fund_items)
			#create new directory to store the file whap app downloaded.
			mkdir()
			#divide the data into small piece as the parameters run in each thread
			divided_items = MyUtils.divide_array(fund_items, int(thread_count))
			thread_pool = []
			index = 0 
			while index <thread_count:
				th = threading.Thread(target=self.work, args=(divided_items[index], index))
				thread_pool.append(th)
				index = index + 1		
			for t in thread_pool:
				t.start()
	
	def work(self, fund_items, thread_index):
		web_fetcher = WebFetcher(server_addr)
		#define the file name 
		sql_base_info = file_path +'/sql/B_' +run_date+'_' +str(thread_index).zfill(2)+'.sql'
		sql_history = file_path + '/sql/H_' +run_date+'_' +str(thread_index).zfill(2)+'.sql'

		f_sql_base_info = open(sql_base_info, 'a')
		f_sql_base_info.write('/*!40101 SET NAMES utf8 */;')
		f_sql_history = open(sql_history,'a') 
		f_sql_history.write('/*!40101 SET NAMES utf8 */;')

		baseInfoFetcher = BaseInfoFetcher()
		historyFetcher = HistoryFetcher()
		
		if is_initial:
			baseInfoFetcher.run(fund_items, f_sql_base_info, web_fetcher)
			historyFetcher.run(fund_items, f_sql_history, web_fetcher)
		else:
			not_exist_funds = historyFetcher.get_not_exist_funds(fund_items)
			if not_exist_funds != []:
				baseInfoFetcher = BaseInfoFetcher()
				baseInfoFetcher.run(not_exist_funds,f_sql_base_info, web_fetcher)
			historyFetcher.run(fund_items, f_sql_history,  web_fetcher)
		f_sql_base_info.close()
		f_sql_history.close()

		adapter.run(sql_base_info)
		adapter.run(sql_history)

class BaseInfoFetcher:
	def run(self, items, sql_file, web_fetcher):
		for fund in items:
			fund_record = json.loads(fund.encode('utf8'))	
			fund_code = fund_record['fund_code']
			fund_name = fund_record['fund_name']
			# get the web page from sseinfo.com
			# and save to a file
			url = fund_url_base +'fundcode=' + fund_code

			html_file = file_path+'/data/base_info/b_'+fund_code+'.html'
			html = web_fetcher.run(url, html_file, show_url)
			# parse the html content to an array.
			parser = FundHTMLParser()
			all_data = parser.read(html);
			# get the contents we needed neccessary
			data = self.get_base_info(all_data, fund_name) 
			# generate the sql statement and save to a sql file
			adapter.save_base_info(data, sql_file)

	def get_base_info(self, data, fund_name):
		result = []
		i = 0 
		while i<16:
			if (i % 2 == 1):
				result.append(data[i])
			i = i+1

		record = []
		record.append(result[1])
		record.append(fund_name)
		record.append(result[0])
		record.append(result[2])
		record.append(result[3])
		record.append(result[4])
		record.append(result[5])
		record.append(result[6])
		record.append(result[7])
		record.append('0')
		record.append('0')	
		result = record
		return result

class HistoryFetcher:
	def run(self, items, sql_file,  web_fetcher):
		for fund in items:
			fund_record = json.loads(fund.encode('utf8'))
			fund_code = fund_record['fund_code']
			url =  fund_url_history +'fundcode='+fund_code;

			html_file = file_path +'/data/history/h_'+ fund_code+'.html'
			html = web_fetcher.run(url, html_file, show_url)

			parser = FundHTMLParser()
			html = parser.read(html);
			html = self.get_base_info(html) 
			i = 0
			sql_value = []
			for item in html:
				if i % 8 ==0:
					if sql_value != []:
						adapter.save_history_value(sql_value, sql_file)
					sql_value = []
				sql_value.append(item)
				i = i+1

	def get_base_info(self, data):
		result = []
		if is_initial:
			i = 0
			for item in data:
				if i>=8:
					result.append(item)
				i = i +1
		else:
			m = 8;
			while m<16 :
				m = m + 1
				result.append(data[m])

		return result

	def get_not_exist_funds(self, fund_items):
		sql = 'select FUNDCODE from FUD_BASE' 
		records = adapter.get_records(sql)	
	
		records_in_db = []	
		for record in records:
			records_in_db.append(record[0])	
		print 'records in db:', len(records_in_db)

		result = []
		for item in fund_items:
			fund_record = json.loads(item.encode('utf8'))	
			fund_code = fund_record['fund_code']
			exist = False 
			for record in records_in_db:
				if fund_code == record:
					exist =  True
					break
			if not exist:
				result.append(item) 
		return result

# main entry.
if __name__ == "__main__":
	config = AppConfig()
	config = config.load_config()

	fund_url_base = config.get('fund', 'fund_url_base')
	fund_url_daily = config.get('fund', 'fund_url_daily')
	fund_url_history = config.get('fund', 'fund_url_history')
	fund_type_count = int(config.get('fund', 'fund_type_count'))
	day_offset = int(config.get('fund', 'day_offset'))
	server_addr = config.get('fund', 'server_addr')
	run_date = MyUtils.getDayByOffset(day_offset) 		
	is_initial = MyUtils.str2bool(config.get('run', 'is_initial'))
	print is_initial
	file_path = config.get('run', 'file_path')+run_date
	thread_count = int(config.get('run', 'thread_count'))
	show_url = config.get('run', 'show_url')
	adapter = MySQLAdapter(config)
	fi = FundInfo();
	fi.run()	
	
