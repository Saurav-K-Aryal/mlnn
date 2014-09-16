clear; close all; clc;
nn = create_NN(2, 2, 1, 2, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.00001, 0.9, 5000, -1, -1);
pat = xor_pattern(nn.ni -1);

[nn, t, out, J, iteration] = train_show(nn, t, pat);

out = [out, out> 0.5]
