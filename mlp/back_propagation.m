function [nn, tnew] = back_propagation(nn, training, target, ao, ai, ah)

	output_delta = 0;
	ERROR = target - ao;
	output_delta = (derivative(nn, ao) .* ERROR)';

	hidden_deltas = zeros(nn.nh-1, 1);
	error_hidden = nn.wo(2:end, :) * output_delta;	
	hidden_deltas = derivative(nn, ah(1, 2:end))' .* error_hidden;

	change = (output_delta * ah)';
	nn.wo = nn.wo + training.N * change + training.M * training.co;
	con = change;
	change = (hidden_deltas * ai)';
	nn.wi = nn.wi .+ training.N .* change + training.M .* training.ci;
	cin = change;
	tnew = training;
	tnew.co = con;
	tnew.ci = cin;
end

