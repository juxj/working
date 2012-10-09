#!/usr/bin/env python
# -*- coding utf-8 -*- 

import os, sys, string, httplib
from BeautifulSoup import *

class WebFetcher:
    def __init__(self, url):
        self.url = url

    def format_html_data(self, data):
        result = []
        line = ''
        for d in data:
            if d != '\n':
                    line = line + d
            else:
                if line != '':
                    result.append(line)
                line = ''
        return result


    def __get_domain(self):
        return 'db.money.sohu.com' 

    def get_html_page(self):
        # get server domain
        server_domain = self.__get_domain();
        # connect to the web server
        conn = httplib.HTTPConnection(server_domain)
        # fetch the page.
        conn.request('GET', self.url)
        response = conn.getresponse()
        html_data = response.read()
        soup = BeautifulSoup(''.join(html_data))
        html_data = soup.prettify()
        #html_file = open('kk.html','a')
        #html_file.write(html_data)
        #html_file.close()
        return self.format_html_data(html_data)	
