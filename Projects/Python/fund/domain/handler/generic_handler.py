#!/usr/bin/env python
from env import sites, read, save, handler

class GenericHandler:
	
	def __init__(self, config, company, node, code, data, dao):
		self.config = config
		self.company = company
		self.node = node
		self.code = code
		self.data = data		
		self.dao = dao

	def handle_data(self):
		actions = {
			'info':lambda:self.get_info(),
			'nav':lambda:self.get_nav(),
			'manager':lambda:self.get_manager(),
			'invest':lambda:self.get_invest(),
			'yield':lambda:self.get_yield(),
			'consignee':lambda:self.get_consignee()
		}			
		return actions[self.node]()
		
	def get_info(self):
		data = handler.get_html_data(self.config, self.node, self.data, 0)
		self.dao.save_fund(self.company, self.code, data)
	
	def get_manager(self):
		'''
		handler.get_html_data(config, node, data, 0)
		'''

	def get_nav(self):
		'''
		data_type = config.get(node, 'data_type')
		if data_type == 'json':
			handler.get_json_data(config, node+'_json', data)
		else:
			handler.get_html_data(config, node+'_html', data, 1 )
		'''


	def get_yield(self):
		'''
		data = handler.get_soup_data(config, node, data)
		table_index = config.get(node, 'table_index').split(',')
		for index in table_index:	
			data = data[int(index)].prettify()
			handler.get_html_data(config, node, data, 1)
		'''

	def get_consignee(self):
		'''
		data = handler.get_soup_data(config, node, data)
		data = data[0].prettify()
		data = handler.get_html_data(config, node, data, 1)
		'''
	
	def get_invest(self, config, node, data):
		'''
		invest_nodes = config.get(node, 'data_nodes').split(',')
		data = handler.get_soup_data(config, node, data)
		'''
				
		for invest_node in invest_nodes:
			node_name = node +'_'+ invest_node 	
			print '******'+node_name+'******'
			table_index = config.get(node_name, 'table_index')
			data = data[int(table_index)].prettify()
			handler.get_html_data(config, node_name, data, 1)
