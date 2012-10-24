#!/usr/bin/env python
from env import read, save, handler 
from utils.app_util import app_util
from domain.dao import * 
from domain.model.fund_manager import FundManager
from domain.model.fund_nav import FundNAV
from domain.model.fund_invest import FundInvest
from domain.model.fund_charge import FundCharge
from domain.model.fund_roi import FundROI

class GenericHandler:
	
	def __init__(self, config, company, node, code, data):
		self.config = config
		self.company = company
		self.node = node
		self.code = code
		self.data = data		

	def handle_data(self):
		actions = {
			'info':lambda:self.get_info(),
			'nav':lambda:self.get_nav(),
			'manager':lambda:self.get_manager(),
			'invest':lambda:self.get_invest(),
			'charge':lambda:self.get_charge(),
			'roi':lambda:self.get_roi(),
			'consignee':lambda:self.get_consignee(),
			'yield':lambda:self.get_yield()
		}			
		return actions[self.node]()
		
	def get_roi(self):
		tables = handler.get_soup_data(self.config, self.node, self.data)
		table_index = self.config.get(self.node, 'table_index')
		data = tables[int(table_index)].prettify()
		data = handler.get_html_data(self.config, self.node,data, 0)
		fund = self.get_fund()	
		roi = FundROI(fund, data)
		dao = fund_roi_dao
		dao.save_fund_roi(roi)
		
	def get_info(self):
		data = handler.get_html_data(self.config, self.node, self.data, 0)
		fund_dao.save_fund(self.company, self.code, data)
	
	def get_manager(self):
		data = handler.get_html_data(self.config, self.node, self.data, 0)
		fund = self.get_fund()
		if fund != None:
			manager = FundManager(self.company, fund, data) 
			fund_manager_dao.save_fund_manager(manager)

	def get_nav(self):
		data_type = self.config.get(self.node, 'data_type')
		data = ''
		if data_type == 'json':
			node = self.node+'_json'
			data = handler.get_json_data(self.config, node , self.data)
			source_fields = self.config.get(node, 'source_fields').split(',')
			fund = self.get_fund() 
			if fund != None:
				for item in data:
					record = []
					for field in source_fields:
						record.append(item[field])
				
					nav = FundNAV(fund, record)
					fund_nav_dao.save_fund_nav(nav)
		else:
			data = handler.get_html_data(self.config, self.node+'_html', self.data, 1 )

	def get_invest(self):

		data = handler.get_soup_data(self.config, self.node, self.data)
		table_index = self.config.get(self.node, 'table_index').split(',')
		tables = []
		for index in table_index:
			tables.append(data[int(index)])

		fund = self.get_fund()
		invest = FundInvest(fund, tables)	
		dao = fund_invest_dao
		dao.save_fund_invest(invest)

	def get_charge(self):

		data = handler.get_soup_data(self.config, self.node, self.data)
		table_index = self.config.get(self.node, 'table_index').split(',')
		tables = []
		for index in table_index:
			tables.append(data[int(index)])

		fund = self.get_fund()
		charge = FundCharge(fund, tables)	
		dao = fund_charge_dao
		dao.save_fund_charge(charge)

	def get_yield(self):
		'''
		data = handler.get_soup_data(config, node, data)
		table_index = config.get(node, 'table_index').split(',')
		for index in table_index:	
			data = data[int(index)].prettify()
			handler.get_html_data(config, node, data, 1)
		'''

	def get_consignee(self):
		'''
		data = handler.get_soup_data(config, node, data)
		data = data[0].prettify()
		data = handler.get_html_data(config, node, data, 1)
		'''
	
	def get_fund(self):
		fund = fund_dao.get_fund_by_code(self.code)
		return fund
