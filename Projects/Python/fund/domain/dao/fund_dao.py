from env import Session
from domain.model.models import Fund

class FundDAO:
    def get_fund_list (self):
      return Session.query(Message).all()
