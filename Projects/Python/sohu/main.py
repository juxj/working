#!/usr/bin/env python
# -*- coding: utf-8 -*-
from environment import config
from environment import engine
from environment import fetcher
from utils.web_fetcher import *
from utils.html_parser import *
from utils.app_util import *

import os, sys, string, threading

class Main:
	# get the financial products from database.
	def __get_exist_items(self):
		sql = config.get('sql', 'query')
		records = engine.do_query(sql)
		return records;

	# get financial product codes from web site.
	def __get_product_codes(self):
		# set the return values
		result = []
		urls = []
		# url list
		summary_url = config.get('web_server', 'summary_url')
		# get product types from config file
		p_types = config.get('web_server', 'prod_type').split(',')
		parser = TotalPageParser()

		for p_type in p_types:
			url = summary_url + '&pageNO=1&bkstatus='+p_type
			data = fetcher.run(url)
			data = parser.read(data)
			urls = urls + data[1]
			pages = int(data[0][0])
			
			# until now, 
			# we have fetched out the url list of first page of each product type
			# the next step is going to get the reminder.
			
			m = 2; # start from 2
			while m <= pages:
				url = summary_url + '&pageNO='+str(m)+'&bkstatus='+p_type
				data = fetcher.run(url)
				data = parser.read(data)
				urls = urls + data[1]
				m = m+1
		for url in urls:
			result.append(url[15:23])
		return result;

	def __get_detail_page(self, page_fetcher,  code):

		result = []
		url = config.get('web_server','detail_url')	
		url = url + code[5:8]+'/'+code+'.html'
		data = page_fetcher.run(url)
		parser = SohuHTMLParser()
		data = parser.unescape(unicode(data, 'gbk')) 
		data = parser.read(data);

		del data[39]
		i = 1
		for item in data:
			if i%2 == 0:
				result.append(item)
			i = i+1 		
		return result

	# get product codes not in db.
	def __get_new_products(self):
		result = []
		records = self.__get_exist_items();
		codes = self.__get_product_codes();
		for code in codes:
			code_in_db = False
			for record in records:
				if code == record[0]:
					code_in_db = True
			if not code_in_db:
				result.append(code)
		print 'Web:', len(codes), 'DB:', len(records), 'Size:', len(result)
		return result

	def __work(self, thread_id,  codes):
		#create web fetcher for each thread.
		page_fetcher = WebFetcher(config)
		#sql file name which stores sql script temporary.
		file_name = 'sql/sohu_'+str(thread_id)+'.sql'
		sql_file = open( file_name, 'a')
		sql_file.write('/*!40101 SET NAMES utf8 */;')
		# buidl sql scripts
		i = 1
		for code in codes:
			data = self.__get_detail_page(page_fetcher, code)
			sql = self.__build_sql(code, data)
			sql_file.write(sql)
			i = i+1
			#sys.stdout.write(str(i)+'->'+"\b")
        	#sys.stdout.flush()
		#sys.stdout.write("\n")
		sql_file.close()
		# run sql scripts
		engine.run(file_name)

	def __build_sql(self, code, data):
		sql = 'insert into PRD_BANKFINANCE values (null, \''+ code + '\''
		i = 0
		for item in  data:
			if i<20:
				sql = sql + ', \''+item.encode('utf8')+'\'';
			i = i+1
		return sql + ',0, null,\''+str(AppUtil.getNow())+'\');\n'

	def run(self):
		threads = int(config.get('run', 'threads'))
		products = self.__get_new_products()
		print 'total:', len(products)
		divided_products = AppUtil.divide_array(products, threads)
		i = 0 
		thread_pool = []
		while i<threads:
			th = threading.Thread(target=self.__work, args=(i, divided_products[i],))
			thread_pool.append(th)
			i = i+1
		
		for t in thread_pool:
			t.start()

if __name__ == '__main__':
	main = Main()
	main.run()
