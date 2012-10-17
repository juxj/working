#!/usr/bin/env python
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
		selected_tags = config.get(node, 'selected_tags').split(',')
		data_list_tags = config.get(node, 'data_list_tags').split(',')
		data_index = config.get(node, 'data_index').split(',')
		# parser html data.
		parser = PageInfoParser(selected_tags, data_list_tags)
		data = parser.read(data)
		# refine the data user selected

		if multi:
			field_count = int(config.get(node, 'field_count'))
			start_index = int(config.get(node, 'start_index'))
			self.get_collections(data, start_index,field_count, data_index)
		else:
			for index in data_index:
				print data[int(index)]	
		
	def get_collections(self, data, start_index, field_count, data_index):
		m = 0
		'''
		for m in range(int(start_index)):
			data = data.pop(0)
			m = m + 1
			print len(data)
		'''
		data = app_util.divide_by_record(data, field_count)	

		records = []
		for item in data:
			record = []
			for index in data_index:
				record.append(item[int(index)])
			print record
			records.append(record)
		return records	
		
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
				else:
					self.get_html_data(config, node, data, 0)

