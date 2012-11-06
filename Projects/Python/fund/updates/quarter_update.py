#!/usr/bin/env python
# _*_ coding: utf-8 _*_
from env import handler, skipped_errors, debug, Session
from domain.dao import fund_company_dao, fund_dao, fund_dividend_dao, fund_invest_dao
from domain.handler.generic_handler import GenericHandler
from domain.model.fund_dividend import FundDividend
from domain.model.fund_invest import FundInvest
from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from utils.app_util import get_now, get_offset_day, encode_data

class QuarterUpdate:
	
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
					self.update_dividend(config, fund, fetcher)
					self.update_invest(config,fund, fetcher)
			except:
				if skipped_errors:
					pass
				else:
					raise
			Session.commit()

	def update_dividend(self, config, fund, fetcher):
		node  = 'dividend'
		url = config.get(node, 'url')
		encode = int(config.get(node, 'encode'))
		url = url.replace('{fund_code}', fund.code)
		data = fetcher.get(url)
		if encode:
			data = encode_data(data)

		dividends = fund_dividend_dao.get_dividends_by_code(fund.code) 
		for dividend in dividends:
			Session.delete(dividend)

		data = handler.get_records(config, node, data)
		for item in data:
			fund_dividend = FundDividend(fund, item)
			fund_dividend_dao.add(fund_dividend)

	def update_invest(self, config, fund, fetcher):
		node  = 'invest'
		url = config.get(node, 'url')
		encode = int(config.get(node, 'encode'))
		url = url.replace('{fund_code}', fund.code)
		data = fetcher.get(url)
		if encode:
			data = encode_data(data)

		data = handler.get_records(config, node, data)
		dao = fund_invest_dao
		invest = FundInvest(fund, data)
		dao.add(invest)
