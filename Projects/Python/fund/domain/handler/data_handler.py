#!/usr/bin/env python
from bs4 import BeautifulSoup
from utils.app_util import print_list,divide_by_record
from utils.page_info_parser import PageInfoParser
import os, string, json, re, urllib

class DataHandler:

	def __init__(self, debug):
		self.debug = debug

	def get_json_data(self, config, node, data):
		data_node = config.get(node, 'data_node')
		data = json.loads(data)
		return data[data_node]

	def get_html_data(self, config, node, data, multi):
		# get settings.
		selected_tags = config.get(node, 'selected_tags').strip().split(',')
		data_list_tags = config.get(node, 'data_list_tags').strip().split(',')
		data_index = config.get(node, 'data_index').strip().split(',')
		# parser html data.
		parser = PageInfoParser(selected_tags, data_list_tags)
		data = parser.read(data)
		# refine the data user selected
		start_index = int(config.get(node, 'start_index'))
		tmp = []
		m = 1
		for item in data:            
			if m > start_index:
				tmp.append(item)
			m = m + 1
		data = tmp


		if multi:
			field_count = int(config.get(node, 'field_count'))
			data = self.get_collections(data, field_count, data_index)
		else:
			tmp = []
			length = len(data)
			for index in data_index:
				index = int(index)
				if index>=length:
					index = -1
				if index == -1:
					tmp.append('')
				else:
					tmp.append(data[index])
			data = tmp

		if (int(self.debug[1])):
			print_list(data)
		return data

	def get_collections(self, data,field_count, data_index):
		m = 0
		data = divide_by_record(data, field_count)	
		records = []
		for item in data:
			#print item
			record = []
			length = len(item)
			for index in data_index:
				index = int(index)
				if index > length:
					index = -1

				if index == -1:
					record.append('')
				else:
					tmp = item[index]
					record.append(tmp)

			records.append(record)
		return records	

	def get_soup_data (self, config, node, data):
		keys = config.get(node, 'property_name').split(',')	
		values = config.get(node, 'property_value').split(',')	
		data_tag  = config.get(node, 'data_tag').strip()
		soup_index = config.get(node, 'soup_index').split(',')
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
	

		length = len(data)
		tmp = []
		for index in soup_index:
			index = int(index)
			if index < length:
				item = data[index].prettify()
				tmp.append(item)			
		data = tmp

		if int(self.debug[0]):
			print_list(data)
	
		return data
