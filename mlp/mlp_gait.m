clear; clc;
nn = create_NN(8, 40, 1, 2, @tanh, @tanh_derivative, @tanh_cost_function);
t = create_training(nn, 0.000001, 0.15, 0, -1, 30 );

load dynamics_walk3.mat 

data = [dynamics_walk3(:,1), dynamics_walk3(:, 3), dynamics_walk3(:,7), dynamics_walk3(:,8), dynamics_walk3(:,9), dynamics_walk3(:,10), dynamics_walk3(:,11),  dynamics_walk3(:,12), normalize(dynamics_walk3(:, 2), -6, 6)];
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
