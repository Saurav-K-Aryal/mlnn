function J = sigmoid_cost_function(index, target, output)
	J = (-target(1,index)) * log(output(1,index)) - (1 - target(1,index))* log(1-output(1,index));

end
