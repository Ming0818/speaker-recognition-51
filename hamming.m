function hammed_frames = hamming(frames)
	hammed_frames = zeros(size(frames));
	hamCoef = zeros(1, size(frames)(2));
	for j=1:size(frames)(2)
		hamCoef(1,j) = 0.54 - 0.46*cos(2*pi*(j-1)/(size(frames)(2)-1));
	end
	for i=1:size(frames)(1)
		hammed_frames(i,:) = frames(i,:) .* hamCoef;
	end
	
end
