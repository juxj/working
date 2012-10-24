from env import Session
from domain.model.fund_extra_info import FundExtraInfo

class FundExtraInfoDAO:

	def get_fund_extra_info_list (self):
		return Session.query(Fund).all()

	def get_fund_extra_info_by_code(self, value):
		return Session.query(FundExtraInfo).filter_by(fund_code=value).first()

	def add_fund_extra_info(self, fund_extra_info):
		Session.add(fund_extra_info)

	def update_fund_extra_info(self, fund_extra_info):
		Session.update(fund_extra_info)
	
