#!/usr/bin/env python
# -*- coding utf-8 -*- 

from domain.json_builder import JsonBuilder
from domain.web_fetcher import *
import os, sys, string, httplib

class Test:

	def run(self):
		url = "/bank/view/665/00045665.html"
		fetcher = WebFetcher(url)
		data = fetcher.get_html_page()

		m = 0
		for d in data:
			if d=='\n':
				m = m+1
		print m
		#html_file = open('45665','a')
		#html_file.write(data)
		#html_file.close()
		
		#html_file = open('45665','r')
		#data = html_file.readlines()
		#json = JsonBuilder(data)
		#print json.run()

if __name__=='__main__':
	
	test = Test()
	test.run()
