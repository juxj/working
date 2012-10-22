#!/usr/bin/env python
from bs4 import BeautifulSoup
from utils.app_util import app_util
from utils.page_info_parser import PageInfoParser
from utils.page_info_parser import PageInfoParser
import os, string, json, re, urllib

class DataHandler:

	def get_json_data(self, config, node, data):
		data_node = config.get(node, 'data_node')
		data = json.loads(data)
		return data

	def get_html_data(self, config, node, data, multi):
		# get settings.
		selected_tags = config.get(node, 'selected_tags').strip().split(',')
		data_list_tags = config.get(node, 'data_list_tags').strip().split(',')
		data_index = config.get(node, 'data_index').strip().split(',')
		# parser html data.
		parser = PageInfoParser(selected_tags, data_list_tags)
		data = parser.read(data)
		'''
		m = 0
		for item in data:
			print m, item
			m = m + 1
		'''
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
			data = self.get_collections(data, start_index,field_count, data_index)
		else:
			tmp = []
			for index in data_index:
				index = int(index)
				if index == -1:
					tmp.append('')
				else:
					tmp.append(data[index])
			data = tmp
		
		m = 0
		for item in data:
			print m, item
			m = m + 1
		return data

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
		return records	

	def get_soup_data (self, config, node, data):
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



