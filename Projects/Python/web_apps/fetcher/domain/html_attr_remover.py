#!/usr/bin/env python
# -*- coding utf-8 -*- 
from HTMLParser import HTMLParser

class HTMLAttrRemover(HTMLParser):

	def read(self, data):
		self._result = []
		self.feed(data)
		return self._result

	def handle_starttag(self, tag, attrs):
		self._result.append('<'+tag+'>')

	def handle_endtag(self, tag):
		self._result.append('</'+tag+'>')

	def handle_data(self, data):
		self._result.append(data)
