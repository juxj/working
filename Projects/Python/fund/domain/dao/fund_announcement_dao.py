from env import Session
from domain.model.fund_announcement import FundAnnouncement

class FundAnnouncementDAO:

	def get_fund_announcement_list (self):
		return Session.query(FundAnnouncement).all()

	def get_announcements_by_code(self, value):
		return Session.query(FundAnnouncement).filter_by(fund_code=value).all()

	def add(self, fund_announcement):
		Session.add(fund_announcement)
