from HTMLParser import HTMLParser
from bs4 import BeautifulSoup
from utils.app_util import is_null

class PageParser(HTMLParser):

	def __init__ (self, selected_tags, data_list_tags, attr_tag):
		HTMLParser.__init__(self)
		PageParser.selected_tags = selected_tags
		PageParser.data_list_tags = data_list_tags 
		self.attr_tag = attr_tag
	
	def read(self, data):
		data = data.replace('&nbsp',' ')
		self._lines = []
		self.reset()
		self.feed(data)
		return self._lines

	def	reset(self):
		HTMLParser.reset(self)
		self._level_stack = []
	
	def handle_starttag(self, tag, attrs=None):
		if tag in PageParser.selected_tags:
			self._level_stack.append(tag)
		
		if self.attr_tag != None:
			tag = "/".join(self._level_stack);
			if tag == self.attr_tag[0]:
				for name, value in attrs:
					if name == self.attr_tag[1]:
						self._lines.append(value)

	def handle_endtag(self, tag):
		if self._level_stack and tag in PageParser.selected_tags and tag == self._level_stack[-1]:
			self._level_stack.pop()

	def handle_data(self, data):
		tag = "/".join(self._level_stack);
		if tag in PageParser.data_list_tags:
			html_data = ' '	
			if len(data.strip())>1:
				html_data = ''
				for item in data:
					html_data = html_data + item.strip().replace('\r\n','')
			html_data = html_data.strip()
			self._lines.append(html_data)
