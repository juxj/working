#!/usr/bin/env python
import os, string, json, re, urllib
from bs4 import BeautifulSoup

from env import read, save, handler, Session, skipped_errors
from utils.app_util import *
from domain.dao import  fund_company_dao
from domain.dao import fund_dao

from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher

from domain.handler.generic_handler import GenericHandler

class FundHandler:

	def get_sites(self):
		sites = fund_company_dao.get_fund_company_by_status('1')	
		return sites

	def get_home(self, config, fetcher, site):
		node = 'home'
		url = config.get(node, 'url')
		data = fetcher.get(url)
		data_type = config.get(node, 'data_type')
		codes = []
		if data_type != 'str':
			data = handler.get_records(config, node, data)
			for item in data:
				for link in item:
					if not is_null(link):
						tmp = re.search('[\d]{6}',link)
						if tmp != None:
							codes.append(tmp.group(0))
		else:
			codes = re.findall('[\d]{6}',data)
		
		funds = fund_dao.get_fund_list_by_company(site.id)
		tmp = []
		codes = set(codes)
		for code in codes:
			new = 1
			for fund in funds:
				if code == fund.code:
					new = 0
			if new:
				tmp.append(code)
		codes = tmp
		return codes
	
	def get_site_data(self, site):
		error = ''
		config_file = 'config/data/'+site.config_file
		config = AppConfig().load(config_file)
		domain = config.get('server', 'domain')
		nodes = config.get('server', 'nodes').split(',')
		fetcher = WebFetcher(domain)
		# if sample code is not null, then fetche fund code from index page.
		# else sample code will be applied for all nodes.
		sample_code = config.get('server', 'sample_code')
		codes = [sample_code]

		if is_null(sample_code):
			codes = self.get_home(config,fetcher,site)
		for node in nodes:
			if is_null(node):
				break
			encode = int(config.get(node, 'encode'))
			for code in codes:
				url = config.get(node, 'url')
				url = url.replace('{fund_code}', code)
				try:
					data = fetcher.get(url)	
					if encode:
						data = encode_data(data)	
					handler = GenericHandler(config, site, node, code, data)
					handler.handle_data()
				except:
					error =	error + '['+get_now(0)+']'
					error = error + '/'+site.full_name + '/'+ code + '/' + node
					error = error + '\n'
					error = error + 'url: '+ domain + url + '\n'
					if skipped_errors:
						pass	
					else:
						raise	
		if not is_null(error):
			file_name = 'log/'+get_now(3)+'_'+'.error'
			save(file_name, error.encode('utf8'))

	def get_data(self):
		sites = self.get_sites()
		for site in sites:
			self.get_site_data(site)
			Session.commit()
