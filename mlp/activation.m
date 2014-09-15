%	activations: Vector(1xi) i = number inputs pluss bias;
%	weights: Matrix(ixj) j = number activations of next layer minus bias. 
function A = activation(nn, activations, weights)
	%A = tanh(activations * weights);
	A = nn.activation(activations*weights);
end 
