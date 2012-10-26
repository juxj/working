from env import Session
from domain.model.fund_sales import FundSales

class FundSalesDAO:

	def get_fund_sales_list (self):
		return Session.query(FundSales).all()

	def get_fund_sales_by_code(self, value):
		return Session.query(FundSales).filter_by(fund_code=value).first()

	def add(self, fund_sales):
		Session.add(fund_sales)
