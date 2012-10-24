from env import Session
from domain.model.fund_company import FundCompany

class FundCompanyDAO:

	def get_fund_company_list (self):
		return Session.query(FundCompany).all()


	def get_fund_company_by_status(self, value):
		return Session.query(FundCompany).filter_by(status=value).all()
