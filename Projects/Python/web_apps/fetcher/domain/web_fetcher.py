#!/usr/bin/env python
# -*- coding utf-8 -*- 

import os, sys, string, httplib
from BeautifulSoup import *
from utils.string_util import StringUtil
from fetcher.domain.html_attr_remover import *
from HTMLParser import HTMLParser

class WebFetcher:
	def __init__(self, url):
		parser = HTMLParser()
		self.url = parser.unescape(url)

	def get_html_page(self):
		# get server domain
		domain = StringUtil.get_url_domain(self.url)
		url = StringUtil.get_url_suffix(self.url)
		
		# connect to the web server
		conn = httplib.HTTPConnection(domain)
		# fetch the page.
		conn.request('GET', url)
		response = conn.getresponse()
		data = response.read()
		data = unicode(data, 'gb2312')
		data = data.encode('utf-8')

		remover	= HTMLAttrRemover()
		data = remover.read(data)
	
		return data
