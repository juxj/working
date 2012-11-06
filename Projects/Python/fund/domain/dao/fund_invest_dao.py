from env import Session
from domain.model.fund_invest import FundInvest

class FundInvestDAO:

	def get_fund_invest_list (self):
		return Session.query(FundInvest).all()

	def get_fund_invest_by_code(self, value):
		return Session.query(FundInvest).filter_by(fund_code=value).first()

	def add(self, fund_invest):
		Session.add(fund_invest)
