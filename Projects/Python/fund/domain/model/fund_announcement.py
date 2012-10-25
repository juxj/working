from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import app_util

Base = declarative_base()

class FundAnnouncement(Base):

	__tablename__ = 'fund_announcement'

	id=Column(Integer, primary_key=True)

	title = Column(String)
	url = Column(String)
	issued_date = Column(String)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, html_data):
	
		self.title= html_data[0]
		self.url = html_data[1]
		self.issued_date = html_data[2]

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = app_util.get_now(0)
		self.last_updated_time = app_util.get_now(0)
