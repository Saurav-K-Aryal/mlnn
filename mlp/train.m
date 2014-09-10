function [nn, J] = train(nn, t, pat)

	iteration = 0;
	J = [];
	while 1
		iteration = iteration + 1;
		e = 0;
		for item = 1:size(pat,1)
			input =  pat(item, 1:end-1);
			[ao, ai, ah] = feed_forward(nn, input);
			target = pat(item, end);
			[nn, t] = back_propagation(nn, t, target, ao, ai, ah);
			e = cost_function(target, ao); 
		end	
		J = [J e];
		if iteration == t.iterations
			break;
		end
	end
		

end
