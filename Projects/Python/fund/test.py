#!/usr/bin/env python
from env import read
from bs4 import BeautifulSoup

if __name__ == '__main__':
	file_name = 'data/02_home.html'
	data = read(file_name)
	soup = BeautifulSoup(data)
	tables = soup.find_all('table')
	for table in tables:
		if table.findParent("table") is None:
			print table
