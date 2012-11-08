#!/usr/bin/env python
# -*- coding utf-8 -*- 
from HTMLParser import HTMLParser

class AttrsRemover(HTMLParser):

	__useless = 0	
	
	def discard_tag(self, tag):
		tags = ['script', 'link', 'base',  'style', 'meta', 'mata' ]
		#tags = ['script', 'style' ]
		if tag in tags:
			AttrsRemover.__useless = 1
		else:
			AttrsRemover.__useless = 0
		return AttrsRemover.__useless
		
	def read(self, data):
		self._result = []
		self.feed(data)
		return self._result

	def handle_starttag(self, tag, attrs):
		if not self.discard_tag(tag):
			for name, value in attrs:
				if name in ['style', 'bgcolor', 'border']:
					tag = tag+ ' '+name + '=\''+ value + '\''
			self._result.append('<'+tag+'>')

	def handle_endtag(self, tag):
		if not self.discard_tag(tag):	
			self._result.append('</'+tag+'>')

	def handle_data(self, data):
		if not AttrsRemover.__useless:
			self._result.append(data.strip().replace('/',''))
