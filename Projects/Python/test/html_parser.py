#!/usr/bin/env python
import os
import string
from HTMLParser import HTMLParser

class MyHTMLParser(HTMLParser):
	selected=('div','table')
	
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
		if tag in MyHTMLParser.selected:
			self._level_stack.append(tag)

	def handle_endtag(self, tag):
		if self._level_stack and tag in MyHTMLParser.selected and tag == self._level_stack[-1]:
			self._level_stack.pop()

	def handle_data(self, data):
		self._lines.append(data.strip().replace('\r\n',''));

 
if __name__ == '__main__':
	parser = MyHTMLParser()
	html_file = open('new', 'r')
	data = html_file.read()
	data = parser.read(data)
	for item in data:
		print item
