function xor()

	alpha = 0.01;
	neta = 0.5;
	epochs = 1000;
	training_set = [
			0 0 0
			0 1 1
			1 0 1
			1 1 0];

	m = size(training_set, 1);


	w1 = randn(2, 3);
	w2 = randn(1, 3);

	for iter = 1:	epochs
		for training_example = 1 : m
			% begin activation
			y0 = [1 training_set(training_example, [1 2])]';
			v1 = zeros(2, 1);
			for j = 1: 2
				for i = 1:3
					v1(j) = w1(j,i)*y0(i);
				end
			end
			y1 = [1; 1./(1+exp(-v1))];
			v2 = 0;
			for i = 1:3
				v2 = w2(1, i) * y1(i);
			end

			y2 = 1./(1+exp(-v2));
			% end activation
		
			d2 = training_set(training_example, 3);
			e2 = d2 - y2;

			ldelta2 = e2 .* y2 .* (1 - y2);	

			ldelta = zeros(3,1);
			for j = 1:2
				d = y1(j+1, 1) * (1 - y1(j+1));
				ldelta1(j+1, 1) = d * ldelta2 * w2(1, j);
			end 

			for i = 1:3
				w2(1,i) = w2(1, i) + neta * ldelta2 * y1(i);
			end

			for i = 1:3
				for j = 1:2
					w1(j, i) = w1(j, i) + neta * ldelta1(j+1) * y0(i);
				end
			end
			if iter == epochs
				y2>0.5
			end

		end	
	end		
	
	
end
	
xor()
