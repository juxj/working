#!/usr/bin/env python
from env import read, save, handler
from utils.app_util import app_util
from domain.dao import * 
from domain.model.fund_manager import FundManager
from domain.model.fund_nav import FundNAV
from domain.model.fund_invest import FundInvest
from domain.model.fund_charge import FundCharge
from domain.model.fund_roi import FundROI
from domain.model.fund_dividend import FundDividend
from domain.model.fund_file import FundFile
from domain.model.fund_announcement import FundAnnouncement

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
			'files':lambda:self.get_file(),
			'dividend':lambda:self.get_dividend(),
			'announcement':lambda:self.get_announcement()
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
		data = handler.get_soup_data(self.config, self.node, self.data)
		table_index = self.config.get(self.node, 'table_index').split(',');
		table = data[0]
		table = table.prettify()
	
		data = handler.get_html_data(self.config, self.node,table,1)
		fund = self.get_fund()
		if fund != None:
			for item in data:
				manager = FundManager(self.company, fund, item) 
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

	def get_dividend(self):
		config = self.config
		node = self.node
		data = self.data

		data = handler.get_soup_data(config, node, data)
		index = config.get(node, 'table_index')
		data = data[int(index)].prettify()
		data = handler.get_html_data(config, node, data, 1)
		dao = fund_dividend_dao
		fund = self.get_fund()
		for item in data:
			dividend = FundDividend(fund, item)
			dao.add(dividend)

	def get_file(self):
		data_type = self.config.get(self.node, 'data_type')
		data = ''
		if data_type == 'json':
			node = self.node+'_json'
			data = handler.get_json_data(self.config, node , self.data)
			source_fields = self.config.get(node, 'source_fields').split(',')
			domain = self.config.get('server', 'domain')
			fund = self.get_fund() 
			dao = fund_file_dao
			if fund != None:
				for item in data:
					record = []
					for field in source_fields:
						value = item[field]
						if field == 'url':
							value = domain + value
						record.append(value)
					fund_file = FundFile(fund, record)
					dao.add(fund_file)
		else:
			print 'html'

	def get_announcement(self):
		data_type = self.config.get(self.node, 'data_type')
		data = ''
		if data_type == 'json':
			node = self.node+'_json'
			data = handler.get_json_data(self.config, node , self.data)
			source_fields = self.config.get(node, 'source_fields').split(',')
			domain = self.config.get('server', 'domain')
			fund = self.get_fund() 
			dao = fund_announcement_dao
			if fund != None:
				for item in data:
					record = []
					for field in source_fields:
						value = item[field]
						if field == 'url':
							value = domain + value
						record.append(value)
					announcement = FundAnnouncement(fund, record)
					dao.add(announcement)
		else:
			print 'html'


	def get_fund(self):
		fund = fund_dao.get_fund_by_code(self.code)
		return fund
