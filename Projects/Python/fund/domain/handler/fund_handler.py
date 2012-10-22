#!/usr/bin/env python
from env import sites, read, save, handler
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
import os, string, json, re, urllib


class FundHandler:

	def get_bonus(self, config, node, data):
		data = handler.get_soup_data(config, node, data)
		table_index = config.get(node, 'table_index').split(',')
		for index in table_index:	
			data = data[int(index)].prettify()
			handler.get_html_data(config, node, data, 1)

	def get_consignee(self, config, node, data):
		data = handler.get_soup_data(config, node, data)
		data = data[0].prettify()
		data = handler.get_html_data(config, node, data, 1)
	
	def get_invest(self, config, node, data):
		invest_nodes = config.get(node, 'data_nodes').split(',')
		data = handler.get_soup_data(config, node, data)
				
		for invest_node in invest_nodes:
			node_name = node +'_'+ invest_node 	
			print '******'+node_name+'******'
			table_index = config.get(node_name, 'table_index')
			data = data[int(table_index)].prettify()
			handler.get_html_data(config, node_name, data, 1)

	def get_home(self, config, fetcher):
		node = 'home'
		url = config.get(node, 'url')
		data = fetcher.get(url)
		data = handler.get_soup_data(config, node, data)
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
		error = ''
		for site in sites:
			print '================'+site+'===================='
			config = AppConfig().load('config/'+site+'.ini')
			domain = config.get('server', 'domain')
			nodes = config.get('server', 'nodes').split(',')
			fetcher = WebFetcher(domain)
			codes = self.get_home(config,fetcher)
			#codes = ['050002']
			for code in codes:
				for node in nodes:
					try:
						print '***'+site+'/'+code+'/'+node+'***'
						url = config.get(node, 'url')
						encode = int(config.get(node, 'encode'))
						url = url.replace('{fund_code}', code)
						data = fetcher.get(url)	

						if encode:
							data = self.encode_data(data)	

						if node == 'nav':
							data_type = config.get(node, 'data_type')
							if data_type == 'json':
								handler.get_json_data(config, node+'_json', data)
							else:
								handler.get_html_data(config, node+'_html', data, 1 )
						elif node == 'invest' :
							self.get_invest(config, node, data)
						elif node == 'bonus' or node == 'ROI':
							self.bonus_handler(config, node, data)					
						elif node == 'consignee':
							self.get_consignee(config, node, data)
						else:
							
							handler.get_html_data(config, node, data, 0)
					except:
						info = site + '/'+ code + '/' + node
						error = error + 'Error:' + site + '/'+ code + '/' + node + '\n'
						pass
		if len(error)>0:
			save('error', error)	
			print error

	def encode_data(self, data):
		data = unicode(data, 'gbk')
		return data.encode('utf-8')
