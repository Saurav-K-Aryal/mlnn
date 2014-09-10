%	activations: Vector(1xi) i = number inputs pluss bias;
%	weights: Matrix(ixj) j = number activations of next layer minus bias. 
function A = activation(activations, weights)
	%A = tanh(activations * weights);
	A = 1./(1 + exp(-1 * activations*weights));
end 
