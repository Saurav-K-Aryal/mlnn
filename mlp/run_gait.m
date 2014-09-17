clear all; close all; clc;
load nnt.mat

load dynamics_walk5.mat 
dynamics_walk3 = dynamics_walk5;

data = [dynamics_walk3(:,1), dynamics_walk3(:, 3), dynamics_walk3(:,7), dynamics_walk3(:,8), dynamics_walk3(:,9), dynamics_walk3(:,10), dynamics_walk3(:,11),  dynamics_walk3(:,12), normalize(dynamics_walk3(:, 2), -6, 6)];

out = [];
for item = 1:size(data,1)
	ao = feed_forward(nn, data(item, 1:end-1));
	out = [out; ao];
end

desired = data(:,end);
figure();
plot(out, 'r');
hold on;
plot(desired, 'b');
legend('nn', 'desired');
