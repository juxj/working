from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_now, get_value

Base = declarative_base()

class FundManager(Base):

	__tablename__ = 'fund_manager'
	id=Column(Integer, primary_key=True)

	manager = Column(String)
	gender = Column(String)
	resume = Column(String)
	pic = Column(String)
	start_date = Column(String)
	end_date = Column(String)

	fund_company_id = Column(Integer)
	fund_company_name = Column(String)
	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)

	def __init__(self, company, fund, html_data):

		self.manager = get_value(html_data[0])
		self.gender= get_value(html_data[1])
		self.resume = get_value(html_data[2])
		self.pic = get_value(html_data[3])
		self.start_date = get_value(html_data[4])
		self.end_date = get_value(html_data[5])
		
		
		self.fund_company_id = company.id
		self.fund_company_name = company.full_name
		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
