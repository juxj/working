#!/usr/bin/env python
# -*- coding utf-8 -*- 

import os, sys, string, httplib
from BeautifulSoup import *

class WebFetcher:
	def __init__(self, url):
		self.url = url

	def is_single_line_comment(self, line):
		result = 0
		if line.lstrip().startswith('<!--') \
			and not line.endswith('-->'):
			result = 1
		return result;

	def has_useless_tags(self, line):
		result = 1
		tags = ['<img', '<b', '|'] 
		for tag in tags:
			if line.lstrip().startswith(tag):
				result = 0
		return result
		

	def remove_useless(self, data, n):
		result = []
		useless_tag = 0
		for item in data:

			if self.is_single_line_comment(item):
				useless_tag = 1
			
			if useless_tag ==0:
				start_reading = 1
				if item.lstrip().startswith('<') and item.rstrip().endswith('/>'):
					start_reading = 0
				if n==1:
					start_reading = self.has_useless_tags(item)

				if start_reading:
					result.append(item)
			if item.lstrip().startswith('-->'):
				useless_tag = 0 
		return result
			
	
	def format_html_data(self, data, n):
		result = []
		line = ''
		for d in data:
			if d != '\n':
					line = line + d
			else:
				if line != '':
					#line = unicode(line, 'gbk')
					#line = line.encode('utf-8')
					result.append(line)
					line = ''
		result = self.remove_useless(result, n)
		return result


	def __get_domain(self):

		url = self.url.split('/')
		result = ''
		if self.url.startswith('http'):
			result = url[2]
		else:
			result = url[0]

		return result 

	def save_to_file(self, file_name, data):

		f = open(file_name,'a')
		if len(data)>1:
			for line in data:
				f.write(line)
		else:
			f.write(data)
		f.close()	

	def get_html_page(self):
		# get server domain
		server_domain = self.__get_domain();
		# connect to the web server
		conn = httplib.HTTPConnection(server_domain)
		# fetch the page.
		conn.request('GET', self.url)
		response = conn.getresponse()
		html_data = response.read()
		#html_data = self.format_html_data(html_data, 0)
		soup = BeautifulSoup(''.join(html_data))
		html_data = soup.prettify()
		#html_data = self.format_html_data(html_data, 1)
		self.save_to_file('sina.html', html_data)
		return html_data
