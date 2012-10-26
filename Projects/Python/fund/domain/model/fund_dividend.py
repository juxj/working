from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import *

Base = declarative_base()

class FundDividend(Base):

	__tablename__ = 'fund_dividend'

	id=Column(Integer, primary_key=True)

	year = Column(String)
	register_date = Column(String)
	ex_dividend_date = Column(String)
	delivered_date = Column(String)
	unit = Column(String)
	solution = Column(String)
	distribution_type = Column(String)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, html_data):
	
		count = len(html_data)
		
		self.year= html_data[0]
		self.register_date = html_data[1]
		self.ex_dividend_date = get_value(html_data[2])
		self.delivered_date = get_value(html_data[3])
		self.unit = get_value(html_data[4])
		self.solution = get_value(html_data[5])
		self.distribution_type = get_value(html_data[6])

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0)
