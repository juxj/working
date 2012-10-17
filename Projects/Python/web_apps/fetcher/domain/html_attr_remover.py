#!/usr/bin/env python
# -*- coding utf-8 -*- 
from HTMLParser import HTMLParser

class HTMLAttrRemover(HTMLParser):

	__useless = 0	
	
	def discard_tag(self, tag):
		tags = ['script', 'link', 'base',  'style', 'img', 'meta', 'mata' ]
		#tags = ['script', 'style' ]
		if tag in tags:
			 HTMLAttrRemover.__useless = 1
		else:
			 HTMLAttrRemover.__useless = 0
		return HTMLAttrRemover.__useless
		
	def read(self, data):
		self._result = []
		self.feed(data)
		return self._result

	def handle_starttag(self, tag, attrs):
		if not self.discard_tag(tag):
			self._result.append('<'+tag+'>')

	def handle_endtag(self, tag):
		if not self.discard_tag(tag):	
			self._result.append('</'+tag+'>')

	def handle_data(self, data):
		if not HTMLAttrRemover.__useless:
			self._result.append(data.strip().replace('/',''))
