#!/usr/bin/env python
# _*_ coding: utf-8 _*_
from env import handler, skipped_errors, debug, Session
from domain.dao import fund_company_dao, fund_dao, fund_roi_dao
from domain.handler.generic_handler import GenericHandler
from domain.model.fund_roi import FundROI
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from utils.app_util import get_now, get_offset_day

class DailyUpdate:
	
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
					self.update_roi(config, fund, fetcher)
					self.update_nav(config, site, fund, fetcher)
			except:
				if skipped_errors:
					pass
				else:
					raise
			Session.commit()

	def update_roi(self, config, fund, fetcher):
		node  = 'roi'
		url = config.get(node, 'url')
		url = url.replace('{fund_code}', fund.code)
		data = fetcher.get(url)
		data = handler.get_records(config, node, data)
		if not data is None and len(data):
			fund_roi = fund_roi_dao.get_fund_roi_by_code(fund.code)
			if fund_roi is None:
				fund_roi = FundROI(fund, data)
				fund_roi_dao.add(fund_roi)
			else:
				fund_roi.set_values(data) 

	def update_nav(self, config, site, fund, fetcher):
		node = 'nav'
		url = config.get(node, 'url')
		url = url.replace('{fund_code}', fund.code)
		url = url.replace('{start_date}', get_offset_day(-1)) 
		url = url.replace('{end_date}', get_offset_day(0))
		data = fetcher.get(url)
		genericHandler = GenericHandler(config, site, node, fund.code, data)
		genericHandler.get_nav()
