function nn = create_NN(ni, nh, no)
	nn.ni = ni+1;
	nn.nh = nh+1;
	nn.no = no;
	nn.wi = ((-0.2 - 0.2) * rand(nn.ni, nn.nh - 1)) + 0.2;
	nn.wo = ((-2 - 2) * rand(nn.nh, nn.no)) + 2;
end
