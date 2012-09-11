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
import MySQLdb
import ConfigParser

global server_addr
global summary_url
global detail_url
global file_path
global thread_count
global bank_status
global config
global interval


class Sohu:
	def get_url_list(self):
		fetcher = WebFetcher(server_addr)
		i = 1;
		prod_status = 2;
		result = []
		while (i<=prod_status):
			url = summary_url + '&pageNO=1&bkstatus='+str(i)
			html_file = file_path + 'html/A'+str(i)+'.html'
			html_data = fetcher.run(url, html_file)
			parser = MyHTMLParser()
			data = parser.read(html_data)
			url_list = data[1]
			pages = int(data[0][0])
			m = 2
			while m<=pages:
				url = summary_url + '&pageNO='+str(m)+'&bkstatus='+str(i)
				try:
					html_data = fetcher.run(url, '')
					data = parser.read(html_data)
					url_list = url_list + data[1]
				except:
					print 'error' 
				m = m + 1
			result = result + url_list
			i = i + 1
		return result

	def get_details(self, url_list, adapter, sql_file):
		fetcher = WebFetcher(server_addr)
		i = 0
		for url in url_list:
			if i != 0 and i%interval == 0:
				fetcher.close()
				time.sleep(5)
				fetcher = WebFetcher(server_addr)
			prod_code = url[15:23]

			html_file = file_path + 'html/'+prod_code+'.html'
			html_data = fetcher.run(url, html_file)

			#html_data = fetcher.run(url, ''); 
			try:
				parser = FundHTMLParser()
				data = parser.read(html_data)
			except:
				print 'error', prod_code, '\n' 
		
			result = []
			m = 0
			for item in data:
				item = item.replace('\'','')
				if item.strip() != '':
					result.append(item)
				else:
					if m<20:
						result.append(item)
				if m == 32:
					result.append('null')
				m = m + 1

			adapter.save(prod_code, result, sql_file)
			i = i + 1

	def run(self):
		url_list =  self.get_url_list()
		products = self.getProductsInDB()
		url_not_in_db = []
		for url in url_list:
			prod_code = url[15:23]
			i = 0
			for product in products:
				if prod_code == product:
					i = 1
					break
			if i==0:
				url_not_in_db.append(url)
		print 'total items:'+ str(len(url_not_in_db))

		count = len(url_not_in_db)
		threads = 0
		if count<thread_count:
			threads = count
		else:
			threads = thread_count


		url_list_items = MyUtils.divide_array(url_not_in_db, threads)
		i = 0 
		thread_pool = []
		while i<threads:
			th = threading.Thread(target=self.work, args=(url_list_items[i], i,))	
			thread_pool.append(th)
			i = i + 1
		
		for t in thread_pool:
			t.start()
	def getProductsInDB(self):
		sql = 'select distinct code from PRD_BANKFINANCE'
		adapter = MySQLAdapter(config)
		records = adapter.getRecords(sql)
		products = []
		for record in records:
			products.append(record[0])
		return products

	def work(self, url_list, index):
		adapter = MySQLAdapter(config)	
		sql_file_name = file_path+'sql/sohu'+str(index).zfill(2)+'.sql'
		sql_file = open(sql_file_name, 'a')
		sql_file.write('/*!40101 SET NAMES utf8 */;')
		self.get_details(url_list, adapter, sql_file)
		sql_file.close()
		adapter.run(sql_file_name)

	def getItemsInDB(self):
		sql = 'select distinct code from PRD_BANKFINANCE'
		adapter = MySQLAdapter()
		records = adapter.getRecords(sql)
		
		products = []
		for record in records:
			products.append(record[0])

if __name__ == '__main__':
	# load config
	config = AppConfig()
	config = config.load_config()
	# get the parameters values and set them to global paramters.
	# the paramters related to sohu.com
	server_addr = config.get('sohu', 'server_addr')
	summary_url = config.get('sohu', 'summary_url')
	detail_url = config.get('sohu', 'detail_url')
	#bank_status = config.get('sohu', 'bank_status')
	# the parameters related to runing 
	thread_count = int(config.get('run', 'thread_count'))
	file_path = config.get('run', 'file_path')
	interval = int(config.get('run', 'interval'))
	# enter the main app.
	sohu = Sohu()
	sohu.run()
