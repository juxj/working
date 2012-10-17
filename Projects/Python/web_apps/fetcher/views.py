#!/usr/bin/env python
#coding:utf-8 

from django.shortcuts import render_to_response
from django.http import *
from django.template import RequestContext

from fetcher.domain.json_builder import JsonBuilder
from fetcher.domain.web_fetcher import *
from utils.string_util import *
import os, sys, string, httplib

def build_tree(request):
	url = request.GET['url']
	return render_to_response('fetcher/tree.html',{'url':url}, RequestContext(request))

def get_tree_data(request):

	url = request.GET['url']
	path = '/home/tju/Workspaces/Projects/Python/web_apps/data/'

	file_name = path + request.session.session_key+'.html'
	if os.path.isfile(file_name):
		os.remove(file_name)
	fetcher = WebFetcher(url)
	data = fetcher.get_html_page()	

	# save to file
	f = open(file_name, 'a')
	for line in data:
		f.write(line)
	f.close()

	json = JsonBuilder(file_name)
	#json = JsonBuilder(path+'new.html')
	result = json.get_html_json()
	return HttpResponse(result);
