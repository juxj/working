from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_now, get_value, remove_html_attrs

Base = declarative_base()

class FundSales(Base):

	__tablename__ = 'fund_sales'

	id=Column(Integer, primary_key=True)

	sales_agent = Column(String)

	fund_id = Column(Integer)
	fund_code = Column(String)
	fund_name = Column(String)
	created_time = Column(String)
	last_updated_time = Column(String)

	def __init__(self, fund, sales_agent):

		self.sales_agent = remove_html_attrs(get_value(sales_agent))

		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0)
