clear; close all; clc;
nn = create_NN(3, 6, 1);
t = create_training(nn, 0.00000000001, 1, 10000, 0.08);
pat = xor_pattern(nn.ni -1);

[nn, J, iteration] = train(nn, t, pat);

for item = 1:size(pat,1)
		ao = feed_forward(nn, pat(item, 1:end-1));
		ao
end

J(1,end);
iteration
figure();
plot(J);
