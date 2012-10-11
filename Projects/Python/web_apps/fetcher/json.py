#!/usr/bin/env python
# -*- coding utf-8 -*- 

from domain.json_builder import JsonBuilder
from domain.web_fetcher import *
from domain.html_attr_remover import *

import os, sys, string, httplib


if __name__=='__main__':
	file_name = '/home/tju/Workspaces/Projects/Python/web_apps/data/sse.html'
	# convert html to json
	json = JsonBuilder(file_name)
	result = json.get_html_json()
	print result
