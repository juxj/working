from env import Session

class FundManagerDAO:

	def get_fund_manager_list (self):
		return Session.query(FundManager).all()

	def save_fund_manager(self, manager):
		Session.add(manager)
