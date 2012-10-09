#!/usr/bin/env python
# -*- coding utf-8 -*- 

from django.shortcuts import render_to_response
from django.http import *
from django.template import RequestContext
from HTMLParser import HTMLParser
from fetcher.json_builder import JsonBuilder
import os, sys, string, httplib


def get_server_domain(url):
	return 'db.money.sohu.com' 

#抓取网页
def get_html_data(url):
	# get server domain
	server_domain = get_server_domain(url);
	# connect to the web server
	conn = httplib.HTTPConnection(server_domain)
	# fetch the page.
	conn.request('GET', url)
	response = conn.getresponse()
	html_data = response.read()
	return unicode(html_data,'gbk')


#通过前置空格进行分层
def prettify(html_data):
	

#筛选掉不用的数据内容，并返回Json.
def get_tree_data:
	file_name = "/home/tju/Workspaces/Projects/Python/web_apps/fetcher/new"
	jb = JsonBuilder(file_name)
	return jb.run()

def index(request):
	data = get_html_data(request.GET['url'])
	response = HttpResponse()
	response.write(data)

	#return render_to_response("fetcher/tree.html",{"data":data}, RequestContext(request))
