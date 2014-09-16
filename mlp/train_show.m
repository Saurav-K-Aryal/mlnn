function train_show(nn, t, pat)
	[nn, J, iteration] = train(nn, t, pat);

	out = [];
	for item = 1:size(pat,1)
			ao = feed_forward(nn, pat(item, 1:end-1));
			out = [out; ao];
	end


	out = [out, out > 0.5, pat(:, end)];
	out = [out, out(:,end-1) == out(:,end)];

	out
	e = J(1,end)
	iteration
	figure();
	plot(J);
end
