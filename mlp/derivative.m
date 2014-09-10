%derivative of activation function
function D = derivative(M)
	%D = sech(M).^2;
	D = M .* (1 - M);
end
