function mfcc(s)
	%pre-enfasis 
	ps = pre_emphasis(s);

	%Dividing into frames
	frames = framing(ps, 8000, 0.02, 0.01);

	%Hamming window
	h_frames = hamming(frames);

	%FFT of hammed frames
	fft_hframes = zeros(size(h_frames));
	for i = 1: size(h_frames)(1)
		fft_hframes(i, :) = fft(h_frames(i, :));
	end

	% Filterbanks
	filterbanks(fft_hframes);
end