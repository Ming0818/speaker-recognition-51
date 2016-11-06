%Divide las preemphasised samples en 160 frames.
function frames = framing(ps, f, fd, od)
	s = f * fd;
	overlap = s - f * od;
	frames = zeros(ceil(size(ps)/overlap), s);
	for i = 1 : ceil(size(ps) / overlap)
		from = (i - 1) * overlap + 1;
		to = s + from - 1;
		if to > size(ps) 
			aux = zeros(1,s);
			j = 1;
			for h = from : size(ps)
				aux(j) = ps(h);
				j++;
			end
			frames(i,:) = aux;
		else
			frames(i,:) = ps(from : to);
		end
	end
end