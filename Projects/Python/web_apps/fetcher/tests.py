#!/usr/bin/env python
# -*- coding utf-8 -*- 

from domain.json_builder import JsonBuilder
from domain.web_fetcher import *
from domain.html_attr_remover import *

import os, sys, string, httplib


if __name__=='__main__':
	#url = 'http://www.sseinfo.com/infonet/select.do?method=preFund&fundcode=165508'
	#url = 'http://finance.sina.com.cn/fund/quotes/519185/bc.shtml'
	#url = 'http://finance.sina.com.cn/fund/'
	#url = 'http://quotes.fund.163.com/html/070006.html'
	url = 'http://www.weiyimoney.com/pro_view.php?id=97'
	#url = 'http://www.weiyimoney.com/smrx.php' 
	#url = 'http://www.xtlcw.com/index.php?m=Xtlc&a=view&id=214'
	#url = 'http://data.trust.hexun.com/62499.shtml'
	#url = 'http://trust.jrj.com.cn/product/107083074.shtml'
	#url = 'http://money.sohu.com/20121010/n354553073.shtml'
	
	file_name = '/home/tju/Workspaces/Projects/Python/web_apps/data/sse.html'
	file_name1 = '/home/tju/Workspaces/Projects/Python/web_apps/data/sse1.html'

	# if file exists, remove it.
	if os.path.isfile(file_name):
		os.remove(file_name)
	# fetch web page
	fetcher = WebFetcher(url)
	data = fetcher.get_html_page()
	remover	= HTMLAttrRemover()
	data = remover.read(data)

	# save to file
	f = open(file_name, 'a')
	for line in data:
		f.write(line)
	f.close()
	# convert html to json
	json = JsonBuilder(file_name)
	result = json.get_html_json()
	print result
