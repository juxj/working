#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 1. 获取除去JavaScript的文件数据。
# 2. 构建

class JsonBuilder:

	def __init__(self, html_data):
		self.html_data = html_data

	def is_ignore_tag(self, line):
		tags  = ['<!--', '<img' '.', '</']
		result = 0
		for tag in tags:
			if line.lstrip().startswith(tag):
				result = 1
		return result

	def is_useless_tag(self, line):
		start_tags = ['<script', '</style>']
		end_tags  = ['</style>', '</script>']

		result = 0

		for tag in start_tags:
			if line.lstrip().startswith(tag):
				result = 1

		for tag in end_tags:
			if line.lstrip().startswith(tag):
				result = 2
	
		return result

	def get_html_lines(self):

		lines = self.html_data 
		start_reading = 0
		result = []
		i = 0
		#清除JavsScripts
		useless_tag = False
		for line in lines:

			if (not start_reading):	
				start_reading = line.lstrip().startswith('<html');
			
			if start_reading:

				if self.is_useless_tag(line)==1: 
					useless_tag = True

				if len(line.strip())>0 and not self.is_ignore_tag(line):
					if not useless_tag:
						item  = []
						item.append(i)
						item.append(line.replace("\"","\'"))
						original_length = len(line)
						new_length = len(line.lstrip())
						diff = original_length - new_length
						item.append(diff)
						i = i + 1
						result.append(item)	

				if self.is_useless_tag(line)==2: 
					useless_tag = False

		return result

	#获取HTML中的Tag属性,如ID='', Name=''
	def get_tag_properties(self, line):
		result = []
		tag = 'data'
		properties = line.strip()
		if line.strip().startswith('<'):
			properties  = ''
			line = line.replace('<','').replace('>','').lstrip()	
			line = line.split(' ')
			m = 0
			for node in line:
				if m == 0:
					tag = node
				else:
					properties  = properties + ' ' + node
				m = m + 1
		result.append(tag)
		result.append(properties.lstrip())
		return result				

	#根据前面的空格数量，获取父节点的ID.
	def get_parent_id(self, item, lines):
		result = -1
		if item[2] > 0:
			for line in lines:
				if line[0]>item[0]:
					break
				if item[2]-1 == line[2] :
					result = line[0]
		return result

	#生成单节点JSON
	def build_node(self,m, line, lines):
		if len(line) == 0:
			return '[]'

		try:
			title = str(line[4]).replace('\n','')
			node_id = str(line[0])
			properties = str(line[5]).replace('\n','')
			#json = "{\"data\":\""+title+"\", \"attr\":{\"id\":\""+node_id+"\",\"properties\":\""+properties+"\"},\"state\":\"closed\",\"children\":["+str(self.get_children(line, lines))+"]}";
			comma = ''
			if m>0:
				comma=','

			children = self.get_children(line, lines)

			if children == "true":
				json = "{\"name\":\""+title+"\"}"
			else:
				json = "{\"name\":\""+title+"\",\"children\":["+str(self.get_children(line, lines))+"]}";

			json = comma + json
			return json
		except:
			print 'Error Line:', line


	def build(self):
		lines = self.get_html_lines()
		for line in lines:
			parent_id = self.get_parent_id(line, lines)
			properties = self.get_tag_properties(line[1])
			line.append(parent_id)
			line.append(properties[0])
			line.append(properties[1])
		return lines
	#构建子节点的Json
	def get_children(self, parent, lines):
		children  = []
		json = ''
		for line in lines:
			if line[3] == parent[0]:
				children.append(line)

		if len(children)>0:
			m = 0
			for child in children:	
				json = json + self.build_node(m, child, lines)
				m = m+1
		else:
			json = 'true'
		return json
		
	def get_json(self, lines):
		line = []
		for item in lines:		
			if item[3]==-1:
				line = item	
				break
		return self.build_node(0, line, lines);

	def run(self):
		lines = self.build()
		return self.get_json(lines) 

if __name__ == '__main__':
	html_file = open('sohu.prettify', 'r')
	html_data = html_file.readlines()
	json = JsonBuilder(html_data)
	print json.run();
