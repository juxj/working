import struct
import httplib

class WebFetcher:
	def __init__(self, config):
		self.conn = httplib.HTTPConnection(config.get('web_server','url'))

	def run(self, url):
		try:
			self.conn.request('GET', url)
			response = self.conn.getresponse()
			print url, response.status, response.reason
			data = response.read()
			return data
		except:
			print 'error:', url
		
	def close(self):
		self.conn.close()
