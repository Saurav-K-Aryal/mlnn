function xor()

	lambda = 0.01;
	iterations = 10000;
	%This software is based on lecture 7 through 9 from Professor Andrew Ng of Coursera Site
	%The training set is the truth table to the xor logic port with 2 inputs
	training_set = [
			0 0 0
			0 1 1
			1 0 1
			1 1 0];

	m = size(training_set, 1);


	theta1 = rand(10,3);
	theta2 = rand(1,11);
	delta1 = D1 = zeros(10, 3);
	delta2 = D2 = zeros(1, 11);

	for iter = 1:iterations	
		for training_example = 1 : m
			% begin activation
			a1 = [1 training_set(training_example, [1 2])]';
			z2 = theta1 * a1;
			a2 = [1; 1./(1+exp(-z2))];
			z3 = theta2 * a2;
			a3 = 1./(1+exp(-z3));
			% end activation

			ldelta3 = a3 - training_set(training_example, 3);	
			ldelta2 = theta2' * ldelta3 .* a2 .* (1 - a2);
			ldelta2 = ldelta2(2:end, :);

			delta2 = delta2 + ldelta3 * a2';
			delta1 = delta1 + ldelta2 * a1';
		end	
		D2(:, 2:end) = ((1/m) * delta2 + lambda * theta2)(:, 2:end);
		D1(:, 2:end) = ((1/m) * delta1 + lambda * theta1)(:, 2:end);
		theta2 = theta2 + D2;
		theta1 = theta1 + D1;
	end		
	
	out = [];
	for training_example = 1 : m
		% begin activation
		a1 = [1 training_set(training_example, [1 2])]';
		z2 = theta1 * a1;
		a2 = [1; 1./(1+exp(-z2))];
		z3 = theta2 * a2;
		a3 = 1./(1+exp(-z3));
		% end activation
		out = [out; a3];
	end	

	out
end
	
xor()
