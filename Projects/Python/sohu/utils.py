import struct
import os
import os.path
import sys
import string
import time
import httplib
from HTMLParser import HTMLParser
import json
import shutil
import datetime
from datetime import timedelta
import ConfigParser
import MySQLdb

class AppConfig:
    def __init__(self):
        self.config = {}

    def load_config(self):
        config = ConfigParser.RawConfigParser()
        config.read('config.ini')
        return config
	
class WebFetcher:
	def __init__(self, server_addr):
		self.conn = httplib.HTTPConnection(server_addr)

	def run(self, url, html_file=''):
		start_time = datetime.datetime.now()
		try:
			self.conn.request('GET', url)
			response = self.conn.getresponse()
			#print url, response.status, response.reason
			data = response.read()
			end_time = datetime.datetime.now()
			if html_file != '':
				file = open(html_file, 'a')
				file.write(data)
				file.close()
			data = unicode(data, 'gbk')
			data = data.encode('utf8')
			return data
		except:
			print 'error'
		
	def close(self):
		self.conn.close()
class MyHTMLParser(HTMLParser):
	def read(self, data):
		try:
			self._result = []
			self._total_page = []
			self._url_list = []
			self.feed(data)
			self._result.append(self._total_page)
			self._result.append(self._url_list)
			return self._result
		except:
			print 'HTMLPaser Error'

	
	def get_total_num(self, tag, attrs):
		if tag=='input':
			has_total_page = 0
			for name, value in attrs:
				if name=='id' and value == 'pageSum':
					has_total_page = 1
			if has_total_page:
				self._total_page.append(attrs[3][1])

	def get_url_list(self, tag, attrs):
		if tag=='a' and len(attrs)==3:
			url =  attrs[0][1]	
			if url.find('bank/view')>0:
				self._url_list.append(url)
		
	def handle_starttag(self, tag, attrs):
		self.get_total_num(tag, attrs)
		self.get_url_list(tag, attrs)

class FundHTMLParser(HTMLParser):

	selected=('div','table', 'tr', 'td')
	
	def __init__ (self):
		HTMLParser.__init__(self)

	def read(self, data):
		self._lines = []
		self.reset()
		self.feed(data)
		return self._lines

	def	reset(self):
		HTMLParser.reset(self)
		self._level_stack = []
	
	def handle_starttag(self, tag, attrs):
		if tag in FundHTMLParser.selected:
			self._level_stack.append(tag)

	def handle_endtag(self, tag):
		if self._level_stack and tag in FundHTMLParser.selected and tag == self._level_stack[-1]:
			self._level_stack.pop()

	def handle_data(self, data):
		if "/".join(self._level_stack) in ('div/div/div/table/tr/td', 'table/tr/td') and data != '\n':
			self._lines.append(data)

class MySQLAdapter:

	def __init__(self, config):
		self.host = config.get('mysql', 'host')
		self.user = config.get('mysql', 'user')
		self.password = config.get('mysql', 'password')
		self.db_name = config.get('mysql', 'db_name')

	def format_data_size(self, data):
		data_len = len(data)
		if (data_len>40):
			i = 0
			while (i<data_len-40):
				data[39]= data[39] + data[39+i]
				i = i + 1
		return data

	def save(self, prod_code, data, sql_file):
		sql = 'insert into PRD_BANKFINANCE values (null, \''+ prod_code + '\''
		i = 1
		m = 0
		data = self.format_data_size(data)
		for item in data:
			if m<40:
				if i%2 ==0:
					value = item.strip()
					if value.find('\''):
						value = value.replace('\'', '')
					if m in [3,7]:
						value = MyUtils.get_number(value)

					if value == 'null':
						sql = sql + ',' + value +''
					else:
						sql = sql + ',\'' + value +'\''
				m = m + 1
			i = i + 1
		sql = sql + ', 0, null, \''+str(MyUtils.getNow())+'\');\n'
		sql_file.write(sql)

	def getRecords(self, sql):
		conn=MySQLdb.connect(host=self.host,user=self.user,passwd=self.password,db=self.db_name)
		cursor = conn.cursor()
		cursor.execute(sql)
		result = cursor.fetchall()
		return result

	def run(self, sql_file):
		cmd = 'mysql -h '+self.host+' -u '+self.user+' -p'+self.password+'  '+self.db_name +'<'+sql_file +' -f'
		os.system(cmd)


class MyUtils:
	@staticmethod
	def getDayByOffset(offset):
		now = datetime.datetime.now()
		delta = datetime.timedelta(days=offset)
		yesterday = now + delta
		yesterday = yesterday.strftime('%Y-%m-%d')
		return yesterday	

	@staticmethod
	def getToday():
		now = datetime.datetime.now()
		return now.strftime('%Y-%m-%d');
	
	@staticmethod
	def getNow():
		return datetime.datetime.now()

	@staticmethod	
	def str2bool(v):
		return v.lower() in ("yes", "true", "t", "1")

	@staticmethod
	def get_number(str_value):
		result = ''
		number = '0123456789'
		for c in str_value:
			if c in number:
				result = result + c
		return result

	@staticmethod
	def divide_array(items, group_count):

		result = []

		record_count = len(items)
		array_size  = record_count / group_count

		m=0
		while m<group_count:
			n = 0
			sub_result = []
			while n<array_size:
				index = (m*array_size) + n 
				sub_result.append(items[index])
				n = n + 1
			result.append(sub_result)
			m = m +1

		handled_total = group_count * array_size
		remain = record_count - handled_total
		if remain>0:
			i = 0
			while i<remain:
				result[i].append(items[handled_total + i])
				i = i + 1
		return result
