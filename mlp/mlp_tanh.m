clear; close all; clc;
nn = create_NN(2, 6, 1, @tanh, @tanh_derivative, @tanh_cost_function);
t = create_training(nn, 0.0007, 0.002, 10000, -1, -1);
pat = xor_pattern(nn.ni -1);

[nn, t, out, J, iteration] = train_show(nn, t, pat);

out = [out, out > 0.5, pat(:, end)];
out = [out, out(:,end-1) == out(:,end)];
out
