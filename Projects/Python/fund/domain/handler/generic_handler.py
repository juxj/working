#!/usr/bin/env python
import time
from bs4 import BeautifulSoup
from env import read, save, handler,debug
from utils.app_util import * 
from domain.dao import * 
from domain.model.fund_manager import FundManager
from domain.model.fund_nav import FundNAV
from domain.model.fund_invest import FundInvest
from domain.model.fund_charge import FundCharge
from domain.model.fund_roi import FundROI
from domain.model.fund_dividend import FundDividend
from domain.model.fund_file import FundFile
from domain.model.fund_announcement import FundAnnouncement
from domain.model.fund_sales import FundSales

class GenericHandler:
	
	def __init__(self, config, company, node, code, data):
		self.config = config
		self.company = company
		self.node = node
		self.code = code
		self.data = data		
		self.add = int(debug[3])

	def handle_data(self):
		actions = {
			'info':lambda:self.get_info(),
			'nav':lambda:self.get_nav(),
			'manager':lambda:self.get_manager(),
			'invest':lambda:self.get_invest(),
			'charge':lambda:self.get_charge(),
			'roi':lambda:self.get_roi(),
			'files':lambda:self.get_files(),
			'dividend':lambda:self.get_dividend(),
			'sales':lambda:self.get_sales(),
			'announcement':lambda:self.get_announcement()
		}			
		return actions[self.node]()
		
	def get_roi(self):
		data = handler.get_records(self.config, self.node, self.data)
		if self.add:
			fund = self.get_fund()	
			roi = FundROI(fund, data)
			dao = fund_roi_dao
			dao.add(roi)
		
	def get_info(self):
		data = handler.get_records(self.config, self.node, self.data)
		if self.add:
			fund_dao.save_fund(self.company, self.code, data)
	
	def get_manager(self):
		data = handler.get_records(self.config, self.node, self.data)

		domain = self.company.web_site
		fund = self.get_fund()
		if fund != None:
			for item in data:
				if int(debug[3]):
					if not is_null(item[3]):
						item[3] = domain + item[3]
					manager = FundManager(self.company, fund, item) 
					if self.add:
						fund_manager_dao.save_fund_manager(manager)

	def get_nav(self):
		fund = self.get_fund() 
		data_type = self.config.get(self.node, 'data_type')
		dao = fund_nav_dao
		if self.add:
			data = handler.get_records(self.config, self.node, self.data)
			for item in data:
				self.add_nav(dao, fund, item)

	def get_invest(self):
		data = handler.get_records(self.config, self.node, self.data)
		if self.add:
			fund = self.get_fund()
			invest = FundInvest(fund, data)	
			dao = fund_invest_dao
			dao.add(invest)

	def get_charge(self):
		data = handler.get_records(self.config, self.node, self.data)
		if self.add:
			fund = self.get_fund()
			charge = FundCharge(fund, data)	
			dao = fund_charge_dao
			dao.save_fund_charge(charge)

	def get_dividend(self):
		data = handler.get_records(self.config, self.node, self.data)
		if self.add:
			dao = fund_dividend_dao
			fund = self.get_fund()
			for item in data:
				dividend = FundDividend(fund, item)
				dao.add(dividend)

	def get_files(self):
		data_type = self.config.get(self.node, 'data_type')
		domain = self.company.web_site 
		fund = self.get_fund() 
		dao = fund_file_dao
		data = handler.get_records(self.config, self.node, self.data)
		for record in data:
			record[1] = domain+record[1]
			self.add_files(dao, fund, record)

	def get_announcement(self):
		data_type = self.config.get(self.node, 'data_type')
		domain = self.company.web_site 
		dao = fund_announcement_dao
		fund = self.get_fund() 
		data = handler.get_records(self.config, self.node, self.data)
		for record in data:
			record[1] = domain+record[1]
			self.add_announcement(dao, fund, record)

	def add_nav(self,dao, fund, record):
		if int(debug[2]):
			print_list(record)

		if int(debug[3]):
			nav = FundNAV(fund, record)
			dao.save_fund_nav(nav)

	def get_fund(self):
		fund = fund_dao.get_fund_by_code(self.code)
		return fund

	def get_url_list(self, data):
		url_list = []
		soup = BeautifulSoup(data)
		for link in soup.find_all('a'):
			url =  link.get('href')
			url_list.append(url)
		return url_list

	def add_files(self, dao, fund, record):

		if int(debug[2]):
			print_list(record)

		if self.add:
			fund_file = FundFile(fund, record)
			dao.add(fund_file)

	def add_announcement(self, dao, fund, record):

		if int(debug[2]):
			print_list(record)

		if self.add:
			announcement = FundAnnouncement(fund, record)
			dao.add(announcement)

	def get_sales(self):

		data = handler.get_records(self.config, self.node, self.data)
		if int(debug[2]):
			print_list(data)	

		if self.add:
			fund = self.get_fund()
			sales = FundSales(fund, data[0])	
			dao = fund_sales_dao
			dao.add(sales)
