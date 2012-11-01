#!/usr/bin/env python
from bs4 import BeautifulSoup
from utils.app_util import print_list,divide_by_record, is_null
import os, string, json, re, urllib

class DataHandler:

	def __init__(self, debug):
		self.debug = debug

	def get_records (self, config, node, data):
		data = self.do_first_step(config, node, data)
		data = self.do_second_step(config, node, data)
		data = self.do_third_step(config, node, data)
		return  data

	def do_first_step(self, config, node, data):
		keys = config.get(node, 'property_name').split(',')	
		values = config.get(node, 'property_value').split(',')	
		attrs = self.build_attrs(keys, values)
		data_tag  = config.get(node, 'data_tag').strip()
		soup = BeautifulSoup(data)
		if data_tag.strip() != '':
			if len(attrs)>0:
				data = soup(data_tag, attrs = attrs)
			else:
				data = soup(data_tag)
		if int(self.debug[0]):
			print_list(data)
		return data

	def do_second_step(self, config, node, data):	
		soup_index = config.get(node, 'soup_index').split(',')
		selected_tags = config.get(node, 'selected_tags')
		attr_tag = config.get(node, 'attr_tag').split(',')
		length = len(data)
		result = []
		for index in soup_index:
			index = int(index)
			if index < length:
				item = data[index].prettify()
				if is_null(selected_tags):
					result.append(item)	
				else:
					tags = selected_tags.split(',')
					m = 0
					for selected_tag in tags:
						for tag in data[index].find_all(selected_tag):
							m = m + 1
							get_text = self.get_exclusion(config, node, tag) 
							if get_text:
								text = tag.get_text()
								value = ''
								for line in text:
									value = value + line.strip().replace('\n','') 
								result.append(value)			

							value = self.get_attr_value(attr_tag, tag)
							if value is not None:
								result.append(value)
		if int(self.debug[1]):
			print_list(result)
		return result


	def do_third_step(self, config, node, data):
		# get settings.
		multi = int(config.get(node, 'multi'))
		data_index = config.get(node, 'data_index').strip().split(',')
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

		if int(self.debug[2]):
			if multi:
				for item in data:
					print_list(item)
			else:
				print_list(data)
		return data

	def get_collections(self, data,field_count, data_index):
		m = 0
		data = divide_by_record(data, field_count)	
		records = []
		for item in data:
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

	def build_attrs(self, keys, values):
		m = 0	
		attrs = '{'
		for key in keys:
			if key.strip() != '':
				attrs = attrs + '\"' + key +'\":\"' + values[m] + '\"'
				m = m + 1
		attrs = attrs + '}';
		attrs_value = json.loads(attrs);
		return attrs_value

	def get_attr_value(self, attr_tag, tag):
		attr = None
		if len(attr_tag) == 2:
			tag = tag.find(attr_tag[0])
			if not tag is None:
				attr = tag.get(attr_tag[1])	
		return attr

	def get_json_data(self, config, node, data):
		data_node = config.get(node, 'data_node')
		data = json.loads(data)
		return data[data_node]

	def get_parents(self, tag):
		parents = ''
		m = 0
		for parent in tag.parents:
			if m == 0:
				parents = parents + parent.name
			else:
				parents = parents + '/' + parent.name
			m = m + 1
		return parents+'/body/html/[document]'


	def get_exclusion(self, config, node, tag):
		result = True
		excluded_up_tag = config.get(node, 'excluded_up_tag')
		excluded_down_tag = config.get(node, 'excluded_down_tag')

		if not is_null(excluded_up_tag):
			exclusions = tag.find(excluded_up_tag)
			if exclusions is not None:
				result = False

		if not is_null(excluded_down_tag):
			parents = self.get_parents(tag)
			if excluded_down_tag in parents:
				result = False
		return result
