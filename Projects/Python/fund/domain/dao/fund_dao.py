from env import Session
from domain.model.models import Fund

class FundDAO:

	def get_fund_list (self):
		return Session.query(Fund).all()

	def save_fund(self, company, code, html_data):

		
		fund = Fund(company, code, html_data)
		'''
		fund.code = code

		fund.short_name = html_data[0]
		fund.full_name = html_data[1]
		fund.issued_date = html_data[2]
		fund.catelog_name = html_data[3]
		fund.manager = html_data[4]

		fund.administrator = html_data[5]
		fund.custodian = html_data[6]
		fund.investment_goal = html_data[7]
		fund.investment_vision = html_data[8]
		fund.investment_scale = html_data[9]

		fund.investment_strategy = html_data[10]
		fund.characteristics = html_data[11]
		fund.benchmark = html_data[12]
		fund.operation_mode = html_data[13]

		fund.fund_company_id = company.id
		fund.fund_company_name = company.full_name
		fund.catelog_id = None
		fund.status = '0' 
		fund.created_time = app_util.get_now()

		fund.last_update_time = app_util.get_now() 
		'''	
		Session.add(fund)
