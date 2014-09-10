iterations = 1000;
N = 0.5;
M=0.1;

ni = 3; %plus bias
nh = 2;
no = 1;


% Patterns for a xor logic port
pat = [
	0 0 0
	0 1 1
	1 0 1
	1 1 0];

ai = zeros(ni,1);
ah = zeros(nh,1);
ao = 0;

wi = ((-0.2-0.2) * rand(ni, nh)) + 0.2;
wo = ((-0.2 - 2) * rand(nh, no)) + 0.2;

ci = zeros(ni, nh);
co = zeros(nh, no);

iteration = 0;
%for iteration = 1:iterations
J = [];
J2 = [];
J3 = [];
while 1
	iteration = iteration +1;
	err = 0;
	e = 0;
	e3 = 0;
	for item = 1:size(pat,1)
		ai = [1, pat(item, 1:end-1)]; %bias added
		ah = tanh(ai*wi);
		ao = tanh(ah*wo);
		output_delta = 0;
		target = pat(item, end);
		
		ERROR = target - ao;
		output_delta = sech(ao)^2 * ERROR;
		hidden_deltas = zeros(nh, 1);
		error_hidden = output_delta .* wo;	
		hidden_deltas = sech(ah).^2' .* error_hidden;
	
		change = output_delta * ah';
		wo = wo + N * change + M * co;
		co = change;
		change = (hidden_deltas * ai)';
		wi = wi .+ N .* change + M .* ci;
		ci = change;
		err = err + 0.5 * (target - ao).^2;
		e = e + -target * log((ao + 1)/2) - (1-target)*log(1 -(ao + 1)/2);
		e3 = e3 + (-target) * log(ao) - (1 - target)* log(1-ao);
	end	
	J = [J e];
	J2 = [J2 err];
	J3 = [J3 err];
		
	if err < 0.01
		break;
	end
end


for item = 1:size(pat,1)
		ai = [1, pat(item, 1:end-1)]; %bias added
		ah = tanh(ai*wi);
		ao = tanh(ah*wo) >0.5

end
err
iteration
figure();
plot(J);
figure();
plot(J2);
figure();
plot(J3);
