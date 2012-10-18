#!/usr/bin/env python
from utils.app_config import AppConfig

app_config = AppConfig().load('config/config.ini')

sites = app_config.get('funds', 'sites').strip().split(',')
nodes = app_config.get('funds', 'nodes').strip().split(',')

def save(file_name, data):
	f = open(file_name, 'a')
	f.write(data)
	f.close()

def read(file_name):
	f = open(file_name)
	data = f.read()
	f.close()
	return data
