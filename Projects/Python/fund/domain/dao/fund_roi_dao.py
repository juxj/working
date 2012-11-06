from env import Session
from domain.model.fund_roi import FundROI

class FundROIDAO:

	def get_fund_roi_list (self):
		return Session.query(FundROI).all()

	def get_fund_roi_by_code(self, value):
		return Session.query(FundROI).filter_by(fund_code=value).first()

	def add(self, fund_roi):
		Session.add(fund_roi)
