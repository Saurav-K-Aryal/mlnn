function t = create_training(nn, N, M, iterations, err)
	t.N = N;
	t.M = M;
	t.iterations = iterations;
	t.ci = zeros(nn.ni, nn.nh -1);
	t.co = zeros(nn.nh, nn.no);
	t.err = err;
end
