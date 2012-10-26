#!/usr/bin/env python
from utils.web_fetcher import WebFetcher
from utils.app_config import AppConfig
from utils.app_util import *
from domain.dao.fund_company_dao import FundCompanyDAO

class PageFetcher:

	def get_page(self):
		dao = FundCompanyDAO()
		sites = dao.get_fund_company_list()	
		for site in sites:
			# get config file
			config_file = 'config/'+site.config_file
			config = AppConfig().load(config_file)
			domain = config.get('server', 'domain')
			# get pages by node defined in config.ini
			nodes = config.get('server', 'nodes').split(',')
			# call web fetcher
			fetcher = WebFetcher(domain)
			for node in nodes:
				# encode setting.
				encode = int(config.get(node, 'encode'))
				# get url of every node
				url = config.get(node, 'url')
				data = fetcher.get(url)
				if encode:
					data = unicode(data, 'gbk')
					data = data.encode('utf-8')
				file_name = 'data/'+site+'_'+node+'.html'							
				save(file_name, data)
			fetcher.close()
