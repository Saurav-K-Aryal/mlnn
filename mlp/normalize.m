function n = normalize(e)

	n = (e .- (-0)) ./ (pi .- (-0));

end


%!test
%!	assert(normalize([pi, pi/2, 0]) <= 1);
%!test
%!	assert(normalize([pi, pi/2, 0]) >= 0);
