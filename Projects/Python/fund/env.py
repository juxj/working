#!/usr/bin/env python
from utils.app_config import AppConfig
from domain.handler.data_handler import DataHandler
from utils.db_engine import DBEngine

app_config = AppConfig().load('config/config.ini')
skipped_errors = int(app_config.get('app', 'skipped_errors'))
debug = app_config.get('app', 'debug').split(',')

handler = DataHandler(debug)

def save(file_name, data):
	f = open(file_name, 'a')
	f.write(data)
	f.close()

def read(file_name):
	f = open(file_name)
	data = f.read()
	f.close()
	return data

# db engine
engine = DBEngine(app_config)
Session = engine.get_session()
