#!/usr/bin/env python
import MySQLdb
import os

class DBEngine:

	def __init__(self, config):
		self.host = config.get('mysql', 'host')
		self.user = config.get('mysql', 'user')
		self.password = config.get('mysql', 'password')
		self.db_name = config.get('mysql', 'db_name')
		self.conn = MySQLdb.connect(host=self.host,user=self.user,passwd=self.password,db=self.db_name)

	def do_query(self, sql):
		cursor = self.conn.cursor()
		cursor.execute(sql)
		result = cursor.fetchall()
		return result

	def run(self, sql_file):
		cmd = 'mysql -h '+self.host+' -u '+self.user+' -p'+self.password+'  '+self.db_name +'<'+sql_file +' -f'
		print cmd
		os.system(cmd)
