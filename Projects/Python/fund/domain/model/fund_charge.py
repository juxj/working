from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_now, remove_html_attrs, get_value

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

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.update(html_data)

	def update(self,html_data):

		self.buy = remove_html_attrs(get_value(html_data[0]))
		self.application = remove_html_attrs(get_value(html_data[1]))
		self.redemption = remove_html_attrs(get_value(html_data[2]))
		self.management = remove_html_attrs(get_value(html_data[3]))
		self.extra = remove_html_attrs(get_value(html_data[4]))

		self.last_updated_time = get_now(0)
