import os
import os.path
import sys
import string
import time
import json
import shutil
import datetime
from datetime import timedelta

class AppUtil:
	@staticmethod
	def getDayByOffset(offset):
		now = datetime.datetime.now()
		delta = datetime.timedelta(days=offset)
		yesterday = now + delta
		yesterday = yesterday.strftime('%Y-%m-%d')
		return yesterday	

	@staticmethod
	def getToday():
		now = datetime.datetime.now()
		return now.strftime('%Y-%m-%d');
	
	@staticmethod
	def getNow():
		return datetime.datetime.now()

	@staticmethod	
	def str2bool(v):
		return v.lower() in ("yes", "true", "t", "1")

	@staticmethod
	def get_number(str_value):
		result = ''
		number = '0123456789'
		for c in str_value:
			if c in number:
				result = result + c
		return result

	@staticmethod
	def divide_array(items, group_count):

		result = []

		record_count = len(items)
		array_size  = record_count / group_count

		m=0
		while m<group_count:
			n = 0
			sub_result = []
			while n<array_size:
				index = (m*array_size) + n 
				sub_result.append(items[index])
				n = n + 1
			result.append(sub_result)
			m = m +1

		handled_total = group_count * array_size
		remain = record_count - handled_total
		if remain>0:
			i = 0
			while i<remain:
				result[i].append(items[handled_total + i])
				i = i + 1
		return result
