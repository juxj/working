#!/usr/bin/env python
# -*- coding utf-8 -*- 

import os, sys, string, httplib
from BeautifulSoup import *

class WebFetcher:
	def __init__(self, url):
		self.url = url

	def __get_domain(self):
		url = self.url.split('/')
		result = ''
		if self.url.startswith('http'):
			result = url[2]
		else:
			result = url[0]
		return result 

	def __get_url(self):
		url = self.url.replace('https//','').replace('http://','')
		url = url.replace(self.__get_domain(),'')
		return url

	def get_html_page(self):
		# get server domain
		server_domain = self.__get_domain();
		# connect to the web server
		conn = httplib.HTTPConnection(server_domain)
		# fetch the page.
		conn.request('GET', self.__get_url())
		response = conn.getresponse()
		html_data = response.read()
		#html_data = unicode(html_data, 'gbk')
		#html_data = html_data.encode('utf-8')
		#html_data = self.format_html_data(html_data, 0)
		#soup = BeautifulSoup(''.join(html_data))
		#html_data = soup.prettify()
		#html_data = self.format_html_data(html_data, 1)
		#html_data = html_data.replace('&nbsp;','').replace('&copy;','')
		return html_data
