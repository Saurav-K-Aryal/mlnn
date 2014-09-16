clear; clc;
nn = create_NN(3, 20, 1, 2, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.001, 0.9, 0, -1, 12 * 3600 );

load dynamics_walk3.mat 

data = [dynamics_walk3(:,1), dynamics_walk3(:, 3), dynamics_walk3(:,8), normalize(dynamics_walk3(:, 4))];
%data = normalize(data);

selected = randperm(size(data, 1));
selected = selected(:, 1:350);
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

iteration
figure();
plot(J);
figure();
plot(out, 'r');
hold on;
plot(desired, 'b');
legend('nn', 'desired');
