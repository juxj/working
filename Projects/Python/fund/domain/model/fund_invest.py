from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import *

Base = declarative_base()

class FundInvest(Base):

	__tablename__ = 'fund_invest'

	id=Column(Integer, primary_key=True)

	overall = Column(String)
	stock_industry = Column(String)
	stock_top = Column(String)
	bond_catelog = Column(String)
	bond_top = Column(String)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, html_data):
	
		count = len(html_data)
		
		if count>0:	
			self.overall = html_data[0]

		if count>1:		
			self.stock_industry = html_data[1]

		if count>2:
			self.stock_top = html_data[2]

		if count>3:
			self.bond_catelog = html_data[3]
		
		if count>4:
			self.bond_top = html_data[4]

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0)
