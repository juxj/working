from env import Session
from domain.model.fund_charge import FundCharge

class FundChargeDAO:

	def get_fund_charge_list (self):
		return Session.query(FundCharge).all()

	def get_fund_charge_by_code(self, value):
		return Session.query(FundCharge).filter_by(fund_code=value).first()

	def add(self, fund_charge):
		Session.add(fund_charge)
