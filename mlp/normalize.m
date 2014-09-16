function n = normalize(e)

	n = (e .- (-0)) ./ (pi .- (-0));

end


%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(-10, 10, 1, 1, 1, 1);
%!test
%!	assert(normalize(siso_cmac, [10, 9, 8 , 0]) <= 1);
%!test
%!	assert(normalize(siso_cmac, [-10, -9, -8 , 0]) >= -1);
