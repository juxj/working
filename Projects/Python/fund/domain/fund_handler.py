#!/usr/bin/env python
from bs4 import BeautifulSoup
from env import sites, nodes, read
from utils.app_config import AppConfig
from utils.page_info_parser import PageInfoParser
from utils.app_util import app_util

import os, string, json

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
				tmp = unicode(item[int(index)], 'gbk').encode('utf-8')
				print tmp
				record.append(tmp)
			records.append(record)
		print len(records)
		return records	

	def soup_handler(self, config, node, data):
		tag_depth = config.get(node, 'tag_depth').split(',')	
		tag_depth_index = config.get(node, 'tag_depth_index').split(',')	
		data_tag  = config.get(node, 'data_tag').strip()
		soup = BeautifulSoup(data)
		m = 0
		for tag in tag_depth:
			if tag.strip() != '':
				soup = soup.find_all(tag)
				soup = soup[int(tag_depth_index[m])]
				m = m + 1
		soup = soup.find_all(data_tag)	
		return soup
	
	def handle_invest(self, config, node, data):

		invest_nodes = config.get(node, 'data_nodes').split(',')
		soup = self.soup_handler(config, node, data)	
				
		for invest_node in invest_nodes:
			node_name = node +'_'+ invest_node 	
			print '******'+node_name+'******'
			table_index = config.get(node_name, 'table_index')
			data = soup[int(table_index)].prettify()
			self.get_html_data(config, node_name, data, 1)

	def handle_home(self, config, node, data):
		soup = self.soup_handler(config, node, data)
		self.get_html_data(config, node, data, 1)		
			
		
	def get_data(self):
		for site in sites:
			print '================'+site+'===================='
			config = AppConfig().load('config/'+site+'.ini')
			for node in nodes:
				print '*******'+node+'********'
				file_name = 'data/'+site+'_'+node+'.html'
				#print file_name
				data = read(file_name)	
				if node == 'nav':
					data_type = config.get(node, 'data_type')
					if data_type == 'json':
						self.get_json_data(config, node+'_json', data)
					else:
						self.get_html_data(config, node+'_html', data, 1 )
				elif node == 'invest':
					self.handle_invest(config, node, data)
				elif node == 'home':
					self.handle_home(config, node, data)
				else:
					self.get_html_data(config, node, data, 0)
