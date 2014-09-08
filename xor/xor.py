from random import normalvariate
import unittest

def initializeWeights(w):
	for item in w:
		if not isinstance(item, list):
			item = normalvariate(0, 1)
		else:
			for inItem in item:
				inItem = normalvariate(0, 1)	
def main():
	trainingSet = [[0, 0, 0], [0, 1, 1], [1, 0, 1], [1, 1, 1]]

	w1 = [[0, 0], [0, 0], [0, 0]]
	w2 = [0, 0, 0]

	initialize(w1)
	initialize(w2)

class MlpTestCase(unittest.TestCase):
#	def setuUp(self):
		#Nononononon

#	def tearDown(self):
		#nonononon

	def testInitalizeVectorWeights(self):
		w = [0, 0, 0]
		initializeWeights(w)	
		assert w != 0, 'Weight not initialized'

	def testInitalizeMatrixWeights(self):
		w = [[0, 0], [0, 0], [0, 0]]
		initializeWeights(w)	
		assert w != 0, 'Weight not initialized'



class MlpTestSuite(unittest.TestSuite):
	def __init__(self):
		unittest.TestSuite.__init__(self, unittest.makeSuite(MlpTestCase, 'test'))


def runTests():
	runner = unittest.TextTestRunner()
	runner.run(MlpTestSuite())

if __name__ == '__main__':
	runTests()


