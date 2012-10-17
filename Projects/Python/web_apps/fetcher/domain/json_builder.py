#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 1. 获取除去JavaScript的文件数据。
# 2. 构建

from elementtree.ElementTree import *

class JsonBuilder:

	def __init__(self, file_name):
		self.file_name = file_name

	def get_children(self, parent):
		json = ''
		children = parent.getchildren()
		
		tag = parent.tag
		text = parent.text
		try:	
			if len(text)==1:
				text = ''
			else:
				text = text.strip().replace('/','').replace('\n','')
				temp = ''
				for t in text:
					temp = temp + t
				text = temp	
		except:
			text = ''
	
		if len(children)>0:
			json = '{\"name\":\"'+tag+'\",\"title\":\"'+text+'\",\"children\":[' 
			m = 0
			for child in children:
				if m==0:
					json = json + self.get_children(child)
				else:
					json = json + ',' + self.get_children(child)
				m = m+1
			json = json + ']}'							
		else:
			json = '{\"name\":\"'+tag+'\",\"title\":\"'+text+'\"}' 

		return json

	def get_html_json(self):
		tree = ElementTree()	
		root = tree.parse(open(self.file_name))
		return self.get_children(root) 
