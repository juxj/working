#!/usr/bin/env python
# -*- coding utf-8 -*- 

from django.shortcuts import render_to_response
from django.http import *
from django.template import RequestContext
from fetcher.domain.json_builder import JsonBuilder
from fetcher.domain.web_fetcher import *
import os, sys, string, httplib


def build_tree(request):
	url = request.GET['url']
	return render_to_response('fetcher/tree.html',{'url':url}, RequestContext(request))

def get_tree_data(request):

	url = request.GET['url']
	# define file name which temporary store html data.
	path = '/home/tju/Workspaces/Projects/Python/web_apps/data/'
	file_name = path + request.session.session_key
	# if file exists, remove it.
	if os.path.isfile(file_name):
		os.remove(file_name)
	# fetch web page
	fetcher = WebFetcher(url)
	data = fetcher.get_html_page()
	remover	= HTMLAttrRemover()
	data = remover.read(data)

	# save to file
	f = open(file_name, 'a')
	for line in data:
		f.write(line)
	f.close()
	# convert html to json
	json = JsonBuilder(file_name)
	result = json.get_html_json()

	#return HttpResponse('');
	return HttpResponse(result);
