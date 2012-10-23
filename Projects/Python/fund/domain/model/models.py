from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import app_util

Base = declarative_base()

class FundCompany(Base):

	__tablename__ = 'fund_company'

	id=Column(Integer, primary_key=True)
	short_name = Column(String)
	full_name = Column(String)
	web_site = Column(String)    

	
	config_file = Column(String)    
	status  = Column(String)
	last_updated_time = Column(DateTime)

	def __init__(self, short_name, full_name, web_site, config_file, status, last_updated_time):

		self.short_name = short_name
		self.full_name = full_name
		self.web_site = web_site
		self.config_file = config_file
		self.status = status
		self.last_update_time = last_update_time

class Fund(Base):
	__tablename__ = 'fund'
	# 1- 5
	id=Column(Integer, primary_key=True)
	code =  Column(String)
	short_name = Column(String)
	full_name = Column(String)
	issued_date = Column(String)
	# 6 - 10
	catelog_name = Column(String)
	manager = Column(String)
	administrator = Column(String)
	custodian = Column(String)
	investment_goal = Column(String)
	# 11- 15
	investment_vision = Column(String)
	investment_scale = Column(String)
	investment_strategy = Column(String)
	characteristics = Column(String)
	benchmark  = Column(String)
	# 16 - 20
	operation_mode = Column(String)
	fund_company_id = Column(Integer)
	fund_company_name = Column(String)
	catelog_id = Column(String)
	status = Column(String)
	# 21 - 22
	created_time = Column(DateTime)
	last_updated_time = Column(DateTime)
	
	def __init__(self, company, code, html_data):

		self.code = code

		self.short_name = html_data[0]
		self.full_name = html_data[1]
		self.issued_date = html_data[2]
		self.catelog_name = html_data[3]
		self.manager = html_data[4]

		self.administrator = html_data[5]
		self.custodian = html_data[6]
		self.investment_goal = html_data[7]
		self.investment_vision = html_data[8]
		self.investment_scale = html_data[9]

		self.investment_strategy = html_data[10]
		self.characteristics = html_data[11]
		self.benchmark = html_data[12]
		self.operation_mode = html_data[13]

		self.fund_company_id = company.id
		self.fund_company_name = company.full_name
		self.catelog_id = None
		self.status = '0' 
		self.created_time = app_util.get_now()
		self.last_update_time = app_util.get_now() 
			

	'''
	def __init__(self, code, short_name, full_name, issued_date, catelog_name, manager, administrator,
custodian, investment_goal, investment_vision, investment_scale, investment_strategy, characteristics, benchmark, operation_mode, fund_company_id, fund_company_name, catelog_id, status, created_time, last_updated_time):
		self.code = code
		self.short_name = short_name
		self.full_name = full_name
		self.issued_date = issued_date
		self.catelog_name = catelog_name
		self.manager = manager
		self.administrator = administrator
		self.custodian = custodian
		self.investment_goal = investment_goal
		self.investment_vision = investment_vision
		self.investment_scale = investment_scale
		self.investment_strategy = investment_strategy
		self.chararcteristics = characteristics
		self.benchmark = benchmark
		self.operation_mode = operation_mode
		self.fund_company_id = fund_company_id
		self.fund_company_name = fund_company_name
		self.catelog_id = catelog_id
		self.status = status
		self.last_update_time = last_update_time
		self.created_time = created_time
	'''
