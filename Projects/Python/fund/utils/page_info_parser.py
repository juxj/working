from HTMLParser import HTMLParser
from bs4 import BeautifulSoup

class PageInfoParser(HTMLParser):

	def __init__ (self, selected_tags, data_list_tags):
		HTMLParser.__init__(self)
		PageInfoParser.selected_tags = selected_tags
		PageInfoParser.data_list_tags = data_list_tags 
	
	def read(self, data):
		data = data.replace('&nbsp',' ')
		self._lines = []
		self.reset()
		self.feed(data)
		return self._lines

	def	reset(self):
		HTMLParser.reset(self)
		self._level_stack = []
	
	def handle_starttag(self, tag, attrs):
		if tag in PageInfoParser.selected_tags:
			self._level_stack.append(tag)

	def handle_endtag(self, tag):
		if self._level_stack and tag in PageInfoParser.selected_tags and tag == self._level_stack[-1]:
			self._level_stack.pop()

	def handle_data(self, data):
		tag = "/".join(self._level_stack);
		if tag in PageInfoParser.data_list_tags:
			html_data = '&nbsp'	
			if len(data.strip())>1:
				html_data = ''
				for item in data:
					html_data = html_data + item.strip().replace('\r\n','')
			html_data = html_data.strip()
			self._lines.append(html_data)
