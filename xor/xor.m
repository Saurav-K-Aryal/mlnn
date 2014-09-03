function xor()
	lambda = 0.001;
	x = [0 0; 1 0; 0 1; 1 1];
	y = [0 1 1 0]';
	a1 = [[1 1 1 1]', x];
	theta1 = zeros(3,2);
	theta2 = zeros(3, 1);
	for item = 1:1000
		z2 = a1 * theta1;
		a2 = 1./(1+exp(-z2));
		a2 = [[1 1 1 1]', a2];
		z3 = a2 * theta2;
		a3 = 1./(1+exp(-z3));
		ldelta3 = a3 - y;
		ldelta2 = ldelta3*theta2'.*a2.*(1-a2);
		Delta2 = a2' * ldelta3;
		Delta1 = ldelta2 * a1(2:3,:)';
		theta2 = theta2 + (1/4) * Delta2 + lambda; 
		theta1 = theta1 + (1/4) * Delta1;
	end
	a3
	
end

xor();
