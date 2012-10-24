from env import Session
from domain.model.fund_nav import FundNAV

class FundNAVDAO:

	def get_fund_nav_list (self):
		return Session.query(FundNAV).all()

	def save_fund_nav(self, fund_nav):
		Session.add(fund_nav)
