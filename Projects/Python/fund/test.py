#!/usr/bin/env python
from env import read
from bs4 import BeautifulSoup
from utils.page_info_parser import PageInfoParser
from utils.app_util import app_util
import json

if __name__ == '__main__':
	print app_util.get_now(1)
