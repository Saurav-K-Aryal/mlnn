function [h, a1, a2, a3, z2, z3] = fire (theta1, theta2, x)
	a1 = x;
	z2 = theta1 * a1;
	a2 = 1./(1 .+ exp(-1.*z2));
	a2 = [1, 1, 1, 1; a2];

	z3 = theta2 * a2;
	a3 = 1./(1 .+ exp(-1.*z3));	

	h = a3;
end
