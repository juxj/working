from env import Session
from domain.model.fund import Fund

class FundDAO:

	def get_fund_list (self):
		return Session.query(Fund).all()

	def get_fund_list_by_company(self, company_id):
		return Session.query(Fund).filter_by(fund_company_id = company_id).all()

	def get_fund_by_code(self, value):
		return Session.query(Fund).filter_by(code=value).first()

	def save_fund(self, company, code, html_data):
		fund = Fund(company, code, html_data)
		Session.add(fund)
