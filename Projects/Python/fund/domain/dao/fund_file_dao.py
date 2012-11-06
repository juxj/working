from env import Session
from domain.model.fund_file import FundFile

class FundFileDAO:

	def get_fund_file_list (self):
		return Session.query(FundFile).all()

	def get_fund_files_by_code(self, value):
		return Session.query(FundFile).filter_by(fund_code=value).all()

	def add(self, fund_file):
		Session.add(fund_file)
