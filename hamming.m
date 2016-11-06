function hammed_frames = hamming(frames)
	hammed_frames = zeros(size(frames));
	for i=1:size(frames)(1)
		for j=1:size(frames)(2)
			ham = 0.54 - 0.46*cos(2*pi*(j-1)/size(frames)(2)-1);
			hammed_frames(i,j) = frames(i, j) * ham;
		end
	end
end
