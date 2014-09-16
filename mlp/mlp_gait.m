clear; close all; clc;
nn = create_NN(2, 12, 1, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.00001, 0.0001, 0, -1, 9 * 3600);

load angles.mat

data = [angles(3).angle_left, angles(3).av_left, angles(3).angle_right];
data = normalize(data);

selected = randperm(size(data, 1));
selected = (1:350);
pat = data(selected, :);


[nn, J, iteration] = train(nn, t, pat);


out = [];
desired = [];
for item = 1:size(data,1)
		if not(any(item == selected))
			ao = feed_forward(nn, data(item, 1:end-1));
			out = [out; ao];
			desired = [desired; data(item, end)];
		end
end

out;
figure();
plot(J);
figure();
plot(out, 'r');
hold on;
plot(desired, 'b');
legend('nn', 'desired');
