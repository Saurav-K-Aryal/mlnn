X = [
	1 1 1 1
	0 0 1 1
	0 1 0 1];
y= [0 1 1 0];
b = [1 1 1 1];

theta = randn(3, 2);
theta2 = randn(3,1);
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
m = 4;
for i = 1:1000
	z = theta' * X;
	a2 = [1./(1+exp(-z))];
	a2 = [b; a2];

	z2 = theta2' * a2;
	a3 = 1./(1+exp(-z2));

	delta3 = y -a3;

	delta2 = theta2 * delta3 .* a2 .* (1 -a2);

	grad = grad + X * delta2(2:end, :)';
	grad2 = grad2 + a2 * delta3';

	grad = (1/m) * grad;
	grad2 = (1/m) * grad2 + (0.3 /m) * theta2;

	theta = theta + 0.5 * grad;
	theta2 = theta2 + 0.5 * grad2;
end

a3 > 0.5
