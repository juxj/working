#!/usr/bin/env python
from utils.db_engine import DBEngine
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher

config = AppConfig().load('config/config.ini')
engine = DBEngine(config)
fetcher = WebFetcher(config) 
