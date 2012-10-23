#!/usr/bin/env python
import os, string, json, re, urllib

from utils.app_util import app_util
from env import sites, read, save, handler, Session
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from domain.dao.fund_company_dao import FundCompanyDAO
from domain.dao.fund_dao import FundDAO
from domain.handler.generic_handler import GenericHandler


class FundHandler:

	def get_sites(self):
		dao = FundCompanyDAO()
		sites = dao.get_fund_company_by_status('1')	
		return sites

	def get_dao(self, node):
		dao = None
		if node == 'info':
			dao = FundDAO()
		return dao

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
			for node in nodes:
				dao = self.get_dao(node)
				url = config.get(node, 'url')
				encode = int(config.get(node, 'encode'))
				for code in codes:
					try:
						url = url.replace('{fund_code}', code)
						data = fetcher.get(url)	

						if encode:
							data = app_util.encode_data(data)	
						handler = GenericHandler(config, site, node, code, data, dao)
						handler.handle_data()
					except:
						error=error+ site.full_name + '/'+ code + '/' + node + '\n'
						error = error + '['+app_util.get_now()+']'
						error = error + '\n'
						raise
				Session.commit()
		save('error', error.encode('utf8'))
