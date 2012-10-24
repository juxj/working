import sys
from sqlalchemy import *
import sqlalchemy.util as util
from sqlalchemy.orm import *
import string, sys

class DBEngine:
	# initialize paramters which used for db connection
	def __init__(self, config):
		self.host = config.get('db', 'host')
		self.port = config.get('db', 'port')
		self.user = config.get('db', 'user')
		self.password = config.get('db', 'password')
		self.db = config.get('db', 'db')
	# create db engine
	def __create_engine(self):
	
		url = 'mysql://'+self.user+':'+self.password+'@'+self.host+':'+self.port+'/'+self.db
		try:
			engine = create_engine (url, connect_args={'charset':'utf8'}, echo=False )
			return engine
		except Exception as e:
			print 'fetal error encounted', e
			sys.exit()
	# return session for client
	def get_session(self):
		engine = self.__create_engine()
		Session = scoped_session(sessionmaker(bind=engine));
		return Session()
