from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import *

Base = declarative_base()

class FundCharge(Base):

	__tablename__ = 'fund_charge'

	id=Column(Integer, primary_key=True)

	buy = Column(String)
	application = Column(String)
	redemption = Column(String)
	management = Column(String)
	extra = Column(String)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, html_data):
	
		count = len(html_data)
		
		if count>0:	
			self.buy = html_data[0]

		if count>1:		
			self.application = html_data[1]

		if count>2:
			self.redemption = html_data[2]

		if count>3:
			self.management = html_data[3]
		
		if count>4:
			self.extra = html_data[4]

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0)
