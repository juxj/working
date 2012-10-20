#!/usr/bin/env python
from bs4 import BeautifulSoup
from env import sites, read, save
from utils.app_config import AppConfig
from utils.page_info_parser import PageInfoParser
from utils.app_util import app_util
from utils.web_fetcher import WebFetcher

import os, string, json, re, urllib

class FundHandler:

	def get_json_data(self, config, node, data):
		data_node = config.get(node, 'data_node')
		data = json.loads(data)
		print len(data[data_node]) 	

	def get_html_data(self, config, node, data, multi):
		# get settings.
		selected_tags = config.get(node, 'selected_tags').strip().split(',')
		data_list_tags = config.get(node, 'data_list_tags').strip().split(',')
		data_index = config.get(node, 'data_index').strip().split(',')
		# parser html data.
		parser = PageInfoParser(selected_tags, data_list_tags)
		#print data
		data = parser.read(data)
		# refine the data user selected

		if multi:
			field_count = int(config.get(node, 'field_count'))
			start_index = int(config.get(node, 'start_index'))
			tmp = []

			m = 1
			for item in data:            
				if m > start_index:
					tmp.append(item)
				m = m + 1
			data = tmp

			self.get_collections(data, start_index,field_count, data_index)
		else:
			for index in data_index:
				print data[int(index)]	
		
	def get_collections(self, data, start_index, field_count, data_index):
		m = 0
		data = app_util.divide_by_record(data, field_count)	

		records = []
		for item in data:
			record = []
			for index in data_index:
				tmp = item[int(index)]
				record.append(tmp)
			records.append(record)
		print len(records)
		return records	

	def soup_handler(self, config, node, data):

		keys = config.get(node, 'property_name').split(',')	
		values = config.get(node, 'property_value').split(',')	
		data_tag  = config.get(node, 'data_tag').strip()
		soup = BeautifulSoup(data)
		m = 0	
		attrs = '{'
		for key in keys:
			if key.strip() != '':
				attrs = attrs + '\"' + key +'\":\"' + values[m] + '\"'
				m = m + 1
		attrs = attrs + '}';
		
		attrs_value = json.loads(attrs);		

		if data_tag.strip() != '':
			if len(attrs_value)>0:
				data = soup(data_tag, attrs = attrs_value)
			else:
				data = soup(data_tag)

		return data
	
	def handle_invest(self, config, node, data):

		invest_nodes = config.get(node, 'data_nodes').split(',')
		soup = self.soup_handler(config, node, data)	
				
		for invest_node in invest_nodes:
			node_name = node +'_'+ invest_node 	
			print '******'+node_name+'******'
			table_index = config.get(node_name, 'table_index')
			data = soup[int(table_index)].prettify()
			self.get_html_data(config, node_name, data, 1)

	def handle_home(self, config, fetcher):
		node = 'home'
		url = config.get(node, 'url')
		data = fetcher.get(url)
		data = self.soup_handler(config, node, data)
		codes = []
		for item in data:
			for link in item.find_all('a'):
				code =  link.get('href')
				code = re.search('[\d]{6}', code)
				if code != None:
					codes.append(code.group(0))
		codes = set(codes)
		return codes

		
	def get_data(self):
		for site in sites:
			print '================'+site+'===================='
			config = AppConfig().load('config/'+site+'.ini')
			domain = config.get('server', 'domain')
			nodes = config.get('server', 'nodes').split(',')

			fetcher = WebFetcher(domain)
			codes = self.handle_home(config,fetcher)
			error = ''
			for code in codes:
				for node in nodes:
					try:
						print '*******'+site+'/'+node+'('+code+')'+'********'
						url = config.get(node, 'url')
						encode = config.get(node, 'encode')
						url = url.replace('{fund_code}', code)
						data = fetcher.get(url)	
						if encode:
							data = self.encode_data(data)	

						if node == 'nav':
							data_type = config.get(node, 'data_type')
							if data_type == 'json':
								self.get_json_data(config, node+'_json', data)
							else:
								self.get_html_data(config, node+'_html', data, 1 )
						elif node == 'invest':
							self.handle_invest(config, node, data)
						else:
							self.get_html_data(config, node, data, 0)
					except:
						info = site + '/'+ code + '/' + node
						print info
						error = error + site + '/'+ code + '/' + node + '\n'
						pass
			if len(error)>0:
				save('error', error)	

	def encode_data(self, data):
		data = unicode(data, 'gbk')
		return data.encode('utf-8')
