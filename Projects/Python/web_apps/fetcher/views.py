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
	fetcher = WebFetcher(request.GET['url'])
	data = fetcher.get_html_page()
	json = JsonBuilder(data)
	result_value = json.run()

	#json_file = open('/home/tju/Workspaces/Projects/Python/web_apps/fetcher/ll.json', 'r')
	#result_value = json_file.read()
	return HttpResponse(data);
