#!/usr/bin/env python
from env import sites, save
from utils.web_fetcher import WebFetcher
from utils.app_config import AppConfig

class PageFetcher:

	def get_page(self):

		for site in sites:
			# get config file
			config = AppConfig().load('config/'+site+'.ini')
			# call web fetcher
			fetcher = WebFetcher(config.get('server', 'domain'))
			# get pages by node defined in config.ini
			nodes = config.get('server', 'nodes')
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
