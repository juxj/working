from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

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


