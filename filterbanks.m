function filterbanks = filterbanks(frames) 

	low_freq = mel(0);
	high_freq = mel(4000);

	step = (high_freq - low_freq)/33;
	freqs = low_freq:step:high_freq;

end

function f = mel(f)

	f = 1127*log(1 + f/700);

end
