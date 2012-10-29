import os, os.path, sys, string, time, json, shutil, datetime
from datetime import timedelta

def getDayByOffset(offset):
	now = datetime.datetime.now()
	delta = datetime.timedelta(days=offset)
	yesterday = now + delta
	yesterday = yesterday.strftime('%Y-%m-%d')
	return yesterday	

def get_now(dt_type):
	now = datetime.datetime.now()
	dt_format = ['%Y-%m-%d %H:%M:%S','%Y-%m-%d','%Y%m%d%H%M%S','%Y-%m-%d-%H-%M-%S']
	length = len(dt_format)
	if dt_type > length:
		dt_type = length
	return now.strftime(dt_format[dt_type]);

def str2bool(v):
	return v.lower() in ("yes", "true", "t", "1")

def get_number(str_value):
	result = ''
	number = '0123456789'
	for c in str_value:
		if c in number:
			result = result + c
	return result

def print_list(value):
	m = 0
	for item in value:
		print m, item
		m = m + 1

def remove_duplicate(string_array):
	result = []
	m = 0
	for item in string_array:
		if m == 0:
			result.append(item)
		else:
			exist = 0
			for value in result:
				if value == item:
					exist = 1
			if not exist:
				result.append(item)
		m = m + 1	
	return result


def divide_by_group(items, group_count):

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

def divide_by_record(items, record_size):

	result = []
	total = len(items)
	record_count  = total / record_size

	m=0

	while m<record_count:
		n = 0
		sub_result = []
		while n<record_size:
			index = (m*record_size) + n 
			sub_result.append(items[index])
			n = n + 1
		result.append(sub_result)
		m = m +1
	return result

def encode_data(data):
	data = unicode(data, 'gbk')
	return data.encode('utf-8')

def is_null(value):
	result = 1
	if len(value.strip())>0:
		result = 0
	return result

def get_value(value):
	if is_null(value.strip()):
		return None
	else:
		return value
