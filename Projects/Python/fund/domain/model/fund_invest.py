from sqlalchemy import Column, Float, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_now, get_value, remove_html_attrs

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
		self.fund_id = fund.id
		self.fund_code = fund.code
		self.fund_name = fund.full_name
		self.created_time = get_now(0)
		self.update(html_data)

	def update(self, html_data):
		self.overall = remove_html_attrs(get_value(html_data[0]))
		self.stock_industry = remove_html_attrs(get_value(html_data[1]))
		self.stock_top = remove_html_attrs(get_value(html_data[2]))
		self.bond_catelog = remove_html_attrs(get_value(html_data[3]))
		self.bond_top = remove_html_attrs(get_value(html_data[4]))
		self.last_updated_time = get_now(0)
