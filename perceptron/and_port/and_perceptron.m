function and_perceptron()
	X = [
		1 0 0
		1 0 1
		1 1 0
		1 1 1
	];
	class1 = 1;
	class2 = 0;
	class = '';
	y = [0 0 0 1]';

	w = zeros(3,1);

	iterations = 1000;

	for iter = 1:iterations
		for i = 1:size(X,1)
			h = X(i, :) * w;
			if h > 0
				class = class1;
			else
				class = class2;
			end
			for  j = 1: size(w,1)
				if y(i) != class
					if class == class1
						w(j) = w(j) + (-1 - h);
					end
					if class == class2
						w(j) = w(j) + (1 - h);
					end
				end
			end
		end
	end

	w
	X * w
end
