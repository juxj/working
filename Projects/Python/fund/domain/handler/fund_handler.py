#!/usr/bin/env python
import os, string, json, re, urllib

from env import read, save, handler, Session, show_error
from domain.dao import  fund_company_dao

from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from utils.app_util import app_util


from domain.handler.generic_handler import GenericHandler

class FundHandler:

	def get_sites(self):
		sites = fund_company_dao.get_fund_company_by_status('1')	
		return sites

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
		sites = self.get_sites()
		for site in sites:
			config_file = 'config/'+site.config_file
			config = AppConfig().load(config_file)
			domain = config.get('server', 'domain')
			nodes = config.get('server', 'nodes').split(',')
			fetcher = WebFetcher(domain)
			codes = self.get_home(config,fetcher)
			#codes = ['050002']
			for node in nodes:
				encode = int(config.get(node, 'encode'))
				for code in codes:
					url = config.get(node, 'url')
					url = url.replace('{fund_code}', code)
					try:
						data = fetcher.get(url)	
						if encode:
							data = app_util.encode_data(data)	
						handler = GenericHandler(config, site, node, code, data)
						handler.handle_data()
					except:
						error =	error + '['+app_util.get_now(0)+']'
						error = error + '/'+site.full_name + '/'+ code + '/' + node
						error = error + '\n'
						error = error + 'url: '+ domain + url + '\n'
						if show_error:
							raise	
						else:
							pass	
				Session.commit()
		save('log/'+app_util.get_now(3)+'_error', error.encode('utf8'))
