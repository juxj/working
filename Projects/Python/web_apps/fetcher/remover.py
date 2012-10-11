#!/usr/bin/env python
# -*- coding utf-8 -*- 

from domain.json_builder import JsonBuilder
from domain.web_fetcher import *
from domain.html_attr_remover import *
import os, sys, string, httplib


if __name__=='__main__':

	file_name = '/home/tju/Workspaces/Projects/Python/web_apps/data/sse.html'
	f = open(file_name)
	html_data = f.read()
	f.close()

	remover	= HTMLAttrRemover()
	data = remover.read(html_data)
	
	f = open('kkk','a')
	f.write(data)
	f.close()
