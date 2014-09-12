function pat = xor_pattern(num_in)
	% Patterns for a xor logic port
	l = 2^num_in;
	pat = zeros(l, num_in);
	m = l;
	for i = 1:num_in
		j = 0;
		m = m / 2;
		k = 0;
		while j < l
			k = j +  m + 1;
			pat(k:k+m-1,i) = ones(m, 1);
			j = j + 2 * m;
		end
	end

	temp = pat(:, 1);
	for i = 2:num_in
		temp = xor(temp, pat(:,i)); 
	end
	pat = [pat, temp];
end

%!test   
%!	pat = [
%!		0 0 0 
%!		0 1 1
%!		1 0 1
%!		1 1 0];
%!	assert(xor_pattern(2), pat);
%!test
%!	pat = [ 0   0   0 0
%!		0   0   1 1
%!		0   1   0 1
%!		0   1   1 0
%!		1   0   0 1
%!		1   0   1 0
%!		1   1   0 0
%!		1   1   1 1];
%!	assert(xor_pattern(3), pat);
