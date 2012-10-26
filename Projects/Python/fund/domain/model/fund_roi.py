from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import *

Base = declarative_base()

class FundROI(Base):

	__tablename__ = 'fund_roi'

	id=Column(Integer, primary_key=True)

	day_1 = Column(Float)
	week_1 = Column(Float)
	month_1 = Column(Float)
	month_3 = Column(Float)
	month_6 = Column(Float)
	year_0 = Column(Float)
	year_1 = Column(Float)
	year_2 = Column(Float)
	year_3 = Column(Float)
	accumulated = Column(Float)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, html_data):
	
		count = len(html_data)
		
		self.day_1= html_data[0]
		self.week_1 = html_data[1]
		self.month_1 = html_data[2]
		self.month_3 = html_data[3]
		self.month_6 = html_data[4]

		self.year_0 = html_data[5]
		self.year_1 = html_data[6]
		self.year_2 = html_data[7]
		self.year_3 = html_data[8]
		self.accumulated = html_data[9]

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0)
