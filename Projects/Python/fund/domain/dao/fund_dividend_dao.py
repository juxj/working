from env import Session
from domain.model.fund_dividend import FundDividend

class FundDividendDAO:

	def get_fund_dividend_list (self):
		return Session.query(FundDividend).all()

	def get_dividends_by_code(self, value):
		return Session.query(FundDividend).filter_by(fund_code=value).all()

	def add(self, fund_dividend):
		Session.add(fund_dividend)
