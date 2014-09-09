iterations = 1000;
N = 0.5;
M=0.1;

ni = 3; %plus bias
nh = 3;
no = 1;


% Patterns for a xor logic port
pat = [
	0 0 0
	0 1 1
	1 0 1
	1 1 0];

ai = zeros(ni,1);
ah = zeros(nh,1);
ao = 0;

wi = ((-0.2-0.2) * rand(ni, nh)) + 0.2;
wo = ((-2 - 2) * rand(nh, no)) + 2;

ci = zeros(ni, nh);
co = zeros(nh, no);


for iteration = 1:iterations
	err = 0;
	for item = 1:size(pat,1)
		ai = [1; pat(item, 1:end-1)'];
		for j = 1:nh
			sum = 0;
			for i = 1:ni
				sum = sum + ai(i) * wi(i,j);
			end
			ah(j) = tanh(sum); 
		end

		sum = 0;
		for j = 1:nh;
			sum = sum +ah(j, 1) * wo(j, 1);
		end
		ao = tanh(sum);
		
		output_delta = 0;
		target = pat(item, end);
		ERROR = target - ao;
		output_delta = sech(ao)^2 * ERROR;
		
		hidden_deltas = zeros(nh, 1);
		for j = 1:nh
			error_hidden = output_delta * wo(j, 1);	
			hidden_deltas(j, 1) = sech(ah(j,1))^2 * error_hidden;
		end	

		for j = 1:nh
			change = output_delta * ah(j, 1);
			wo(j,1) = wo(j,1) + N * change + M * co(j, 1);
			co(j,1) = change;
		end

		for i =1:ni
			for j = 1:nh
				change = hidden_deltas(j,1)*ai(i, 1);
				wi(i,j) = wi(i,j) + N * change + M * ci(i,j);
				ci(i,j) = change;
			end
		end


		err = err + 0.5 * (target - ao).^2;
		if iteration == iterations
			ao
		end
	end	
end
err
