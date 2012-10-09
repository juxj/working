#!/usr/bin/env python
from HTMLParser import HTMLParser

class TotalPageParser(HTMLParser):
	def read(self, data):
		try:
			self._result = []
			self._total_page = []
			self._url_list = []
			self.feed(data)
			self._result.append(self._total_page)
			self._result.append(self._url_list)
			return self._result
		except:
			print 'HTMLPaser Error'

	
	def get_total_num(self, tag, attrs):
		if tag=='input':
			has_total_page = 0
			for name, value in attrs:
				if name=='id' and value == 'pageSum':
					has_total_page = 1
			if has_total_page:
				self._total_page.append(attrs[3][1])

	def get_url_list(self, tag, attrs):
		if tag=='a' and len(attrs)==3:
			url =  attrs[0][1]	
			if url.find('bank/view')>0:
				self._url_list.append(url)
		
	def handle_starttag(self, tag, attrs):
		self.get_total_num(tag, attrs)
		self.get_url_list(tag, attrs)


class SohuHTMLParser(HTMLParser):
	selected=('div','table', 'tr', 'td', 'p')
	
	def __init__ (self):
		HTMLParser.__init__(self)

	def read(self, data):
		self._lines = []
		self.reset()
		self.feed(data)
		return self._lines

	def	reset(self):
		HTMLParser.reset(self)
		self._level_stack = []
	
	def handle_starttag(self, tag, attrs):
		if tag in SohuHTMLParser.selected:
			self._level_stack.append(tag)

	def handle_endtag(self, tag):
		if self._level_stack and tag in SohuHTMLParser.selected and tag == self._level_stack[-1]:
			self._level_stack.pop()

	def handle_data(self, data):
		if "/".join(self._level_stack) in ('div/div/div/table/tr/td', 'div/div/div/table/tr/td/p'):
			self._lines.append(data.strip().replace('\r\n',''));
