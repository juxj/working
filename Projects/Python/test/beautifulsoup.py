#!/usr/bin/env python
from BeautifulSoup import *
import httplib
import re

class Main:

	def get_page_data(self):
		url = '/bank/view/891/00045891.html'
		conn = httplib.HTTPConnection('db.money.sohu.com')
		conn.request('GET', url)
		response = conn.getresponse()
		print url, response.status, response.reason
		data = response.read()
		data = unicode(data, 'gbk')
		data = data.encode('utf8')
		html_file = open('sohu.html', 'a')
		html_file.write(data)
		html_file.close();

	def get_html_dom(self, data):
		soup = BeautifulSoup(''.join(data))
		return soup.prettify()	
		
	
	def print_nodes(self, contents):
		count = len(contents);
		i = 0;
		for i in xrange(count):
			print contents[i]

	def run(self):
		html_file = open('new.html','r')
		data = html_file.read()
		data =self.get_html_dom(data);
		html_file = open('new.prettify', 'a')
		html_file.write(data)
		html_file.close()

 
if __name__ == '__main__':
	main = Main()
	main.run()
