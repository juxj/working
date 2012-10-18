#!/usr/bin/env python
from env import read
from bs4 import BeautifulSoup

if __name__ == '__main__':
	file_name = 'data/04_invest.html'
	data = read(file_name)
	soup = BeautifulSoup(data)
	tables = soup.find('table').find_all('table')
	print tables[0]

