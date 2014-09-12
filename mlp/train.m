function [nn, J, iteration] = train(nn, t, pat)

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
		if iteration == t.iterations || (t.err != -1 && e <= t.err)
			break;
		end
	end
		

end
%!shared mlp, J, iteration
%!	mlp = create_NN(2, 2, 1);
%!	training_data = create_training(mlp, 0.00000000001, 1, 10000, 0.08);
%!	pat = xor_pattern(mlp.ni - 1);
%!	[mlp, J, iteration] = train(mlp, training_data, pat);
%!test
%!	output = feed_forward(mlp, [0 0]) > 0.5;
%!	assert(! output);
%!test
%!	assert(feed_forward(mlp, [0 1]) > 0.5);
%!test
%!	assert(feed_forward(mlp, [1 0]) > 0.5);
%!test
%!	assert(!(feed_forward(mlp, [1 1]) > 0.5));
%!
%!
%!
%!
%!
%!
%!
%!
%!
