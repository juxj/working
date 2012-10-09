#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 1. 获取除去JavaScript的文件数据。
# 2. 构建

class FormatHTMLToJson:

	def __init__(self, file_name):
		self.file_name = file_name
	
	def get_html_lines(self):
		html_file = open(self.file_name, 'r')
		lines = html_file.readlines()
		result = []
		i = 0
		#清除JavsScripts
		is_java_script = False
		for line in lines:
			if line.lstrip().startswith('<script'):
					is_java_script = True

			if len(line.strip())>0 and not str(line.lstrip()).startswith('</'):
				if not is_java_script:
					item  = []
					item.append(i)
					item.append(line.replace("\"","\'"))
					original_length = len(line)
					new_length = len(line.lstrip())
					diff = original_length - new_length
					item.append(diff)
					i = i + 1
					result.append(item)	

			if line.strip().startswith('</script'):
				is_java_script = False

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
			#print line
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
	def build_node(self, line, lines):
		title = str(line[4]).replace('\n','')
		node_id = str(line[0])
		properties = str(line[5]).replace('\n','')
		json = "{\"data\":\""+title+"\", \"attr\":{\"id\":\""+node_id+"\",\"properties\":\""+properties+"\"},\"state\":\"closed\",\"children\":["+str(self.get_children(line, lines))+"]}";
		return json


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
		m = 0;
		if len(children)>0:
			for child in children:	
				if m==0:
					json = json + self.build_node(child, lines)
				else:
					json  = "," + json + self.build_node(child, lines)
		return json
		
	def get_json(self, lines):
		line = []
		for item in lines:		
			if item[3]==-1:
				line = item	
				break
		return self.build_node(line, lines);

	def run(self):
		lines = self.build()
		return self.get_json(lines) 

if __name__ == '__main__':
	f =  FormatHTMLToJson('new')
	print f.run()
