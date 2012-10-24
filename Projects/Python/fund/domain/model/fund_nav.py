from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import app_util

Base = declarative_base()

class FundNAV(Base):

	__tablename__ = 'fund_nav'
	id=Column(Integer, primary_key=True)

	nav_date = Column(String)
	nav = Column(Float)
	accumulated_nav = Column(Float)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)

	def __init__(self, fund, html_data):

		self.nav_date = html_data[0]
		self.nav = html_data[1]
		self.accumulated_nav = html_data[2]
		
		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
