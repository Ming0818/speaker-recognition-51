function h = pre_emphasis(s)
	a = 0.97;
	h = zeros(size(s));
	h(1) = s(1);
	for i = 2 : size(s)
		h(i) = s(i) - a * s(i-1);
	end
end
