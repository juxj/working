#!/usr/bin/env python
from utils.app_config import AppConfig
from domain.data_handler import DataHandler

app_config = AppConfig().load('config/config.ini')

sites = app_config.get('funds', 'sites').strip().split(',')

handler = DataHandler()

def save(file_name, data):
	f = open(file_name, 'a')
	f.write(data)
	f.close()

def read(file_name):
	f = open(file_name)
	data = f.read()
	f.close()
	return data
