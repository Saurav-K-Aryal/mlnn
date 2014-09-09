from random import normalvariate
import unittest

def initializeWeights(w):
	for item in w:
		if not isinstance(item, list):
			item = normalvariate(0, 1)
		else:
			for inItem in item:
				inItem = normalvariate(0, 1)	

def multiVectorScalar(p1, p2):
	if isinstance(p1, (int, float)) or isinstance(p2, (int,float)):
		if isinstance(p1, list) or isinstance(p2, list):
			vector = []
			scalar = 0
			if isinstance(p1, list):
				vector = p1
				scalar = p2
			else:
				vector = p2
				scalar = p1
			temp = []
			for value in vector:
				if isinstance(value, (float, int)):
					temp.append(value * scalar)
				else:
					raise Exception('Invalid value on vector')
			
			return temp
		else:
			raise Exception('No vector(list) parameter')
	else:
		raise Exception('No scalar parameter')

	
def multiVector(vector1, vector2):
	if isinstance(vector1, list) and isinstance(vector2, list) and len(vector1) == len(vector2):
		temp = 0
		for i in range(len(vector1)):
			if isinstance(vector1, (int, float)) and isinstance(vector2, (int, float)):
				temp = temp + vector1(i) * vector2(i)
			else:
				raise Exception('Non numeric values in vectors')
	else:
		multiVectorScalar(vector1, vector2)


def isMatrix(m):
	if isinstance(m, list):
		lenght = 0
		for item in list:
			if isinstance(item, list):
				if length == 0:
					length = len(list)
				if not len(list) == length:
					return false	
			else
				return false
	else:
		return false	
	return true


						
			
class XorMlp:
	def __init__(self):
		self.trained = False
		self.trainingSet = [[0, 0, 0], [0, 1, 1], [1, 0, 1], [1, 1, 0]]
		self.epochs = 100
		self.w1 = [[0, 0], [0, 0], [0, 0]]
		self.w2 = [0, 0, 0]
		initializeWeights(self.w1)
		initializeWeights(self.w2)

	def trainEpoch(self):
		for trainingItem in self.trainingSet:
			y0 = [1, trainingItem(0), trainingItem(1)]
			v1 = multi_vector(self.w1, y0)
		return;

	def train(self):
		for index in range(self.epochs):
			self.trainEpoch()	

		self.trained = True
		
	def getOutput(self, x1, x2):
		if not self.trained:
			raise Exception('Not trained')
		return 0

def main():
	xor = XorMlp
	xor.train
	for item in xor.trainingSet:
		str = '%d and %d == %d' % (item[0], item[1], xor.getOutput(item[0], item[1]));

class XorMlpTestCase(unittest.TestCase):
	def setUp(self):
		self.xor = XorMlp()	
		self.trainingSet = [[0, 0, 0], [0, 1, 1], [1, 0, 1], [1, 1, 0]]

	def tearDown(self):
		self.xor = None

	def testInitalizeVectorWeights(self):
		w = [0, 0, 0]
		initializeWeights(w)	
		assert w != 0, 'Weight not initialized'

	def testInitalizeMatrixWeights(self):
		w = [[0, 0], [0, 0], [0, 0]]
		initializeWeights(w)	
		assert w != 0, 'Weight not initialized'

	def testNotTrainedGetOutput(self):
		self.assertRaises(Exception, self.xor.getOutput, 0, 0)

	def testStatusAfterTrain(self):
		self.xor.train()
		assert self.xor.trained == True, 'Status after training, wrong.'

	def testCheckTruthTable(self):
		self.xor.train()
		for item in self.trainingSet:
			x1 = item[0]
			x2 = item[1]
			y = item[2]
			output = self.xor.getOutput(x1, x2)
			assert output == y, ('Wrong xor output value. X1 = %d, X2 = %d, Desired = %d, Output = %d' % (x1, x2, y, output))

	def testMultiVectorScalarLast(self):
		assert multiVectorScalar([1, 2], 2) == [2, 4], 'Error multiplying vectors by a scalar'

	def testMultiVectorScalarFirst(self):
		assert multiVectorScalar(2, [1, 2]) == [2, 4], 'Error multiplying vectors by a scalar'
	
	def testMultiVector(self):
		assert multiVector([1, 2], [3, 4]) == 11


class XorMlpTestSuite(unittest.TestSuite):
	def __init__(self):
		unittest.TestSuite.__init__(self, unittest.makeSuite(XorMlpTestCase, 'test'))


def runTests():
	runner = unittest.TextTestRunner()
	runner.run(XorMlpTestSuite())

if __name__ == '__main__':
	main()

