#!/usr/bin/env python
from utils.attrs_remover import AttrsRemover

class Test:

	def run(self):
		remover = AttrsRemover();
		f = open('test.html')
		data = f.read()
		f.close()
		data = remover.read(data)
		result = []
		return data


if __name__ == '__main__':
	t = Test()
	print t.run()


