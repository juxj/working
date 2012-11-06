#!/usr/bin/env python
from domain.handler.page_fetcher import PageFetcher
from domain.handler.fund_handler import FundHandler
from updates.daily_update import DailyUpdate
from updates.weekly_update import WeeklyUpdate
from updates.quarter_update import QuarterUpdate

import sys


class Main:

	def do_first_run(self):
		handler = FundHandler()
		handler.get_data()

	def do_daily_update(self):
		handler = DailyUpdate()
		handler.run()

	def do_weekly_update(self):
		handler = WeeklyUpdate()
		handler.run()

	def do_quarter_update(self):
		handler = QuarterUpdate()
		handler.run()

if __name__ == '__main__':

	main = Main()
	args = sys.argv[1]

	invalid = 1
	
	if  args == '0':
		invalid = 0
		main.do_first_run()


	if  args == '1':
		invalid = 0
		main.do_daily_update()

	if  args == '2':
		invalid = 0
		main.do_weekly_update()

	if  args == '3':
		invalid = 0
		main.do_quarter_update()




	if invalid:
		print 'invalid parameters'
