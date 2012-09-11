import struct
import os
import os.path
import sys
import string
import logging
import time
import httplib
from HTMLParser import HTMLParser
import json
import shutil
import datetime
from datetime import timedelta
import ConfigParser
import MySQLdb

class WebFetcher:
	def __init__(self, server_addr):
		self.conn = httplib.HTTPConnection(server_addr)

	def run(self, url, html_file='', show_url=0):
		start_time = datetime.datetime.now()
		self.conn.request('GET', url)
		response = self.conn.getresponse()
		if show_url:
			print url, response.status, response.reason
		data = response.read()
		end_time = datetime.datetime.now()
		if html_file != '':
			file = open(html_file, 'a')
			file.write(data)
			file.close()
		data = unicode(data, 'gbk')
		#data = data.encode('utf8') 
		
		return data		

class FundHTMLParser(HTMLParser):
	selected=('table','tr','td')
	
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
		if "/".join(self._level_stack) in ('table/tr/td/table/tr/td', 'table/tr/td') and data != '\n':
			self._lines.append(data)

class MySQLAdapter:
	def __init__(self, config):
		self.host = config.get('mysql', 'host')
		self.user = config.get('mysql', 'user')
		self.password = config.get('mysql', 'password')
		self.db_name = config.get('mysql', 'db_name')

	def save_base_info(self, data, sql_file):
		sql = 'insert into FUD_BASE values('
		i = 0
		values = ''
		for item in data:
			value = item.strip()
			value = value.replace('0000-00-00', 'null')
			if i==0: 
				values = values + value;
			else:
				if value == 'null':
					values = values + ','  + item.strip()
				else:	
					values = values + ','  + '\'' + item.strip()+'\''
			i = i+1
		sql = sql+values+');\n'
		sql_file.write(sql.encode('utf8'))

	def save_history_value(self, data, sql_file):
		sql = 'insert into FUD_HISVALUE values (null '
		values = ''
		i = 0
		for item in data:
			if i<>2:
				if i in [3,4,5,6]:
					value = 0
					try:
						value = float(item.strip())
					except:
						value = 'null' 
					values = values + ',' +  str(value)
				else:
					values = values + ','  + '\'' + item.strip()+'\''
			i = i+1
		sql = sql+values+');\n'
		sql_file.write(sql)

	def get_records(self, sql):
		conn=MySQLdb.connect(host=self.host,user=self.user,passwd=self.password,db=self.db_name)
		cursor = conn.cursor()
		cursor.execute(sql)
		result = cursor.fetchall()
		return result

	def run(self, sql_file):
		cmd = 'mysql -h '+self.host+' -u '+self.user+' -p'+self.password+'  '+self.db_name +'<'+sql_file + ' -f'
		os.system(cmd)


class MyUtils:
	@staticmethod
	def getDayByOffset(offset):
		now = datetime.datetime.now()
		delta = datetime.timedelta(days=offset)
		yesterday = now + delta
		yesterday = yesterday.strftime('%Y-%m-%d')
		return yesterday	

	def getToday(self):
		now = datetime.datetime.now()
		return now.strftime('%Y-%m-%d');
	@staticmethod	
	def getNow():
		return datetime.datetime.now()

	@staticmethod	
	def str2bool(v):
		return v.lower() in ("yes", "true", "t", "1")


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
