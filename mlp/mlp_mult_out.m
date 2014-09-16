clear; close all; clc;
nn = create_NN(2, 12, 2, 1, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.00000000001, 1, 2000, -1, -1);
pat = xor_pattern(nn.ni -1);
pat = [pat, not(pat(:,end))];



[nn, t, out, J, iteration] = train_show(nn, t, pat);

out = [out, out > 0.5, pat(:, end-2:end)];
out
