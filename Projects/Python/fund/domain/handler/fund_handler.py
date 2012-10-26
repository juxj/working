#!/usr/bin/env python
import os, string, json, re, urllib
from bs4 import BeautifulSoup

from env import read, save, handler, Session, skipped_error
from utils.app_util import *
from domain.dao import  fund_company_dao

from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher

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
			soup = BeautifulSoup(item)
			for link in soup.find_all('a'):
				code =  link.get('href')
				code = re.search('[\d]{6}', code)
				if code != None:
					codes.append(code.group(0))
		codes = set(codes)
		return codes
	
	def get_site_data(self, site):
		error = ''
		config_file = 'config/'+site.config_file
		config = AppConfig().load(config_file)
		domain = config.get('server', 'domain')
		nodes = config.get('server', 'nodes').split(',')
		fetcher = WebFetcher(domain)
		# if sample code is not null, then fetche fund code from index page.
		# else sample code will be applied for all nodes.
		sample_code = config.get('server', 'sample_code')
		codes = [sample_code]
		if is_null(sample_code):
			codes = self.get_home(config,fetcher)

		for node in nodes:
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
					if skipped_error:
						pass	
					else:
						raise	
			Session.commit()
		save('log/'+get_now(3)+'_'+site.full_name, error.encode('utf8'))

	def get_data(self):
		sites = self.get_sites()
		for site in sites:
			self.get_site_data(site)
