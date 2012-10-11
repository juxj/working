#!/usr/bin/env python
# -*- coding utf-8 -*- 

from domain.json_builder import JsonBuilder
from domain.web_fetcher import *
from domain.html_attr_remover import *
import os, sys, string, httplib
from web_apps.utils.string_util import *

if __name__=='__main__':
	url = 'http://www.sseinfo.com/infonet/select.do?method=preFund&fundcode=165508'
	#url = 'http://finance.sina.com.cn/fund/quotes/519185/bc.shtml'
	#url = 'http://finance.sina.com.cn/fund/'
	#url = 'http://quotes.fund.163.com/html/070006.html'
	#url = 'http://www.weiyimoney.com/pro_view.php?id=97'
	#url = 'http://www.weiyimoney.com/smrx.php' 
	#url = 'http://www.xtlcw.com/index.php?m=Xtlc&a=view&id=214'
	#url = 'http://data.trust.hexun.com/62499.shtml'
	#url = 'http://trust.jrj.com.cn/product/107083074.shtml'
	path = '/home/tju/Workspaces/Projects/Python/web_apps/data/'
	file_name = path + 'sse.html'
	# fetch web page
	fetcher = WebFetcher(url)


	if os.path.isfile(file_name):
		os.remove(file_name)

	domain = StringUtil.get_url_domain(url)
	url = StringUtil.get_url_suffix(url)

	conn = httplib.HTTPConnection(domain)
	# fetch the page.
	conn.request('GET', url)
	response = conn.getresponse()
	html_data = response.read()
	html_data = unicode(html_data, 'gb2312')
	html_data = html_data.encode('utf-8')
	data = html_data 

	remover	= HTMLAttrRemover()
	data = remover.read(data)
	# save to file
	f = open(file_name, 'a')
	for line in data:
		f.write(line)
	f.close()


	'''
	if fetcher.run(file_name):
		# convert html to json
		json = JsonBuilder(file_name)
		result = json.get_html_json()
	'''
