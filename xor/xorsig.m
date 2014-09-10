iterations = 1000000;
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
maxerr = 0;
meiter = 0;
while 1
	iteration = iteration +1;
	err = 0;
	for item = 1:size(pat,1)
		ai = [1, pat(item, 1:end-1)]; %bias added
		ah = 1./(1+exp(-1*ai*wi));
		ao = 1./(1+exp(-1*ah*wo));
		output_delta = 0;
		target = pat(item, end);
		
		ERROR = target - ao;
		output_delta =  (ao .* (1 - ao)) .* ERROR;
		hidden_deltas = zeros(nh, 1);
		error_hidden = output_delta .* wo;	
		hidden_deltas = (ah .* (1 -ah))' .* error_hidden;
	
		change = output_delta * ah';
		wo = wo + N * change + M * co;
		co = change;
		change = (hidden_deltas * ai)';
		wi = wi .+ N .* change + M .* ci;
		ci = change;
		err = err + 0.5 * (target - ao).^2;
	end	
	J = [J err];
	if (maxerr < err)
		maxerr = err;
		meiter = iteration;	
	end
	if err < 0.0000001 || iteration == iterations
		break;
	end
end


for item = 1:size(pat,1)
		ai = [1, pat(item, 1:end-1)]; %bias added
		ah = tanh(ai*wi);
		ao = tanh(ah*wo) 

end
err
iteration
maxerr
iteration
plot(J);
