class StringUtil:

	@staticmethod
	def get_url_domain(url):

		url_array = url.split('/')
		result = ''
		if url.startswith('http'):
			result = url_array[2]
		else:
			result = url_array[0]
		return result 

	@staticmethod
	def get_url_suffix(url):
		domain = StringUtil.get_url_domain(url)
		url = url.replace('https//','').replace('http://','')
		url = url.replace(domain,'')
		return url

