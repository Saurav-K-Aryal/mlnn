function J = cost_function(target, output)
	%J =  (-target) * log((output + 1)/2) - (1-target)*log(1 -(output + 1)/2);
	J = (-target) * log(output) - (1 - target)* log(1-output);
end
