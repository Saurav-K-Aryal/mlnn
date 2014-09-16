clear; close all; clc;
nn = create_NN(2, 12, 2, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.00000000001, 1, 2000, -1, -1);
pat = xor_pattern(nn.ni -1);
pat = [pat, not(pat(:,end))];
[nn, J, iteration] = train(nn, t, pat);

out = [];
for item = 1:size(pat,1)
		ao = feed_forward(nn, pat(item, 1:end-nn.no));
		out = [out; ao];
end


%out = [out, out > 0.5, pat(:, end-1:end)];

e = J(1,end)
iteration
figure();
plot(J);
