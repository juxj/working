#!/usr/bin/env python
from domain.page_fetcher import PageFetcher
from domain.fund_handler import FundHandler

import sys


class Main:

	def get_data(self):
		handler = FundHandler()
		handler.get_data()
	
	def get_page(self):
		pf = PageFetcher()
		pf.get_page()



if __name__ == '__main__':

	main = Main()

	if len(sys.argv) == 1:	
		main.get_data()
	else:
		main.get_page()
