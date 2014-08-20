x =    [1, 1, 1, 1;
	0, 0, 1, 1;
	0, 1, 0, 1];

m = 4;
y = [0 1 1 0];

lambda = 0;
alfa = 0.001;

theta1 = rand(2, 3);
theta2 = rand(1, 3);
D1 = Delta1 = zeros(4, 3);
D2 = Delta2 = zeros(4, 3);

J = []
for epoch = 1:100000
	[h, a1, a2, a3, z2, z3] = fire(theta1, theta2, x);

	ldelta3 = a3 - y;
	ldelta2 = theta2'*ldelta3 .* a2 .* (1 - a2);
	
	for i = 1:m
		for j = 1:3 
			Delta2(i, j)  = Delta2(i, j) + a2(j) * ldelta3(i); 
			Delta1(i, j)  = Delta1(i, j) + a1(j) * ldelta2(i);
			D2(i,j) = (1/m)*Delta2(i,j);
			D1(i,j) = (1/m)*Delta1(i,j);	
			
			theta2(j) = theta2(j) - alfa * D2(i,j);
			theta1(1, j) = theta1(1, j) - alfa * D2(i,j);
			theta1(2, j) = theta1(1, j) - alfa *  D2(i,j);
			
		end
	end	

		
	j = (-1/m) * sum( y * log(a3')  + (1-y) * log(1 - a3')) +(lambda/(2*m))* (sum(sum(theta1.^2)) + sum(sum(theta2.^2)));
	J = [J, j];
end

h = fire(theta1, theta2, x)
plot(J)
