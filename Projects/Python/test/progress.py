#!/usr/bin/env python
# -*- coding=utf-8 -*-
import sys,time
from threading import *

class Test(Thread):

	def __init__(self, thread_id):
		self.n = 0
		self.thread_id = thread_id
		Thread.__init__(self)

	def work(self):
		for self.n in xrange(5):
			time.sleep(0.5)
			self.get_processed_count()

	def get_processed_count(self):
		return self.n
		

if __name__ == '__main__':
	thread_pool = []
	for m in range(0,3):
		th = Test(m) 
		thread_pool.append(th)
	for t in thread_pool:
		t.work()
	in_process = True
	while in_process:
		total = 0
		for t in thread_pool:
			total = total + t.get_processed_count()+1
			print total
		if total >=15:
			in_process = False
