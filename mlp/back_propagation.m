function [nn, tnew] = back_propagation(nn, training, target, ao, ai, ah)
	training.N = 0.00000000001;
	training.M=1;
	output_delta = 0;
	ERROR = target - ao;
	output_delta = derivative(ao) * ERROR;
	hidden_deltas = zeros(nn.nh-1, 1);
	error_hidden = output_delta .* nn.wo(2:end, :);	
	hidden_deltas = derivative(ah(1, 2:end))' .* error_hidden;

	change = output_delta * ah';
	nn.wo = nn.wo + training.N * change + training.M * training.co;
	con = change;
	change = (hidden_deltas * ai)';
	nn.wi = nn.wi .+ training.N .* change + training.M .* training.ci;
	cin = change;
	tnew = training;
	tnew.co = con;
	tnew.ci = cin;
end

