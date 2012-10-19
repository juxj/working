#!/usr/bin/env python
from env import read
from bs4 import BeautifulSoup
from utils.page_info_parser import PageInfoParser
import json

if __name__ == '__main__':

	#file_name = 'data/02_home.html'
	#file_name = 'a.html'
	file_name = 'b.html'
	data = read(file_name)
	#soup = BeautifulSoup(data)
	#tables = soup('table', recursive=False)
	#tables = soup('table', recursive=True)
	#tables = soup.table
	#tables = soup('table')
	#tables = soup.find('table', recursive=True)
	#attrs_value = json.loads("{\"class\":\"stripeTbl\"}")
	##tables = soup.find_all('div', attrs={'id':'left_area_2'})
	#tables = soup.find_all('table', attrs=attrs_value)
	#print tables[0]
	#print tables
	
	selected_tags = ['table', 'tr', 'td']
	data_list_tags = 'table/tr/td'
	
	parser = PageInfoParser(selected_tags, data_list_tags)
	data = parser.read(data)
	for item in data:
		print item
