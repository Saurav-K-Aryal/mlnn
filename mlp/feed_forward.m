function [output, ai, ah] = feed_forward(nn, input)
	ai = [1, input]; %bias added
	ah = [1, activation(ai, nn.wi)]; %bias added
	ao = activation(ah, nn.wo);	
	output = ao;
end
