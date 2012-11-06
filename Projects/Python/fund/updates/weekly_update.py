#!/usr/bin/env python
# _*_ coding: utf-8 _*_
from env import handler, skipped_errors, debug, Session
from domain.dao import fund_company_dao, fund_dao, fund_file_dao, fund_announcement_dao
from domain.handler.generic_handler import GenericHandler
from domain.model.fund_file import FundFile
from domain.model.fund_announcement import FundAnnouncement
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from utils.app_util import get_now, get_offset_day, encode_data

class WeeklyUpdate:
	
	def run(self):
		sites = fund_company_dao.get_fund_company_by_status(1);
		for site in sites:
			path = 'config/update/'
			fetcher = WebFetcher(site.web_site)
			config_file = path + site.config_file
			config = AppConfig().load(config_file)
			funds = fund_dao.get_fund_list_by_company(site.id)
			try:	
				for fund in funds:
					self.update_files(config, fund, fetcher)
					self.update_announcement(config,fund, fetcher)
			except:
				if skipped_errors:
					pass
				else:
					raise
			Session.commit()

	def update_files(self, config, fund, fetcher):
		node  = 'files'
		url = config.get(node, 'url')
		encode = int(config.get(node, 'encode'))
		url = url.replace('{fund_code}', fund.code)
		data = fetcher.get(url)
		if encode:
			data = encode_data(data)

		data = handler.get_records(config, node, data)
		fund_files = fund_file_dao.get_fund_files_by_code(fund.code) 
		for item in data:
			new = 1
			for fund_file in fund_files:
				if item[0] == fund_file.title:
					new = 0

			if new:
				fund_file = FundFile(fund, item)
				fund_file_dao.add(fund_file)

	def update_announcement(self, config, fund, fetcher):
		node  = 'announcement'
		url = config.get(node, 'url')
		encode = int(config.get(node, 'encode'))
		url = url.replace('{fund_code}', fund.code)
		data = fetcher.get(url)
		if encode:
			data = encode_data(data)

		data = handler.get_records(config, node, data)
		dao = fund_announcement_dao
		announcements = dao.get_announcements_by_code(fund.code) 
		for item in data:
			new = 1
			for announcement in announcements:
				if item[0] == announcement.title:
					new = 0

			if new:
				announcement = FundAnnouncement(fund, item)
				dao.add(announcement)
