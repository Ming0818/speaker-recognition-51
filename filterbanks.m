function filterbank = filterbanks(frames) 

	low_freq = mel(300);
	high_freq = mel(4000);

	step = (high_freq - low_freq)/27;
	freqs = low_freq:step:high_freq;

	nfft = 160;

	roundedFreqs = zeros(size(freqs));
	for i = 1 : size(freqs)(2)
		roundedFreqs(1,i) = floor((nfft+1)*imel(freqs(1,i))/8000);
	end

	filterbank = zeros(26,nfft);
	for j = 1 : 26
		for h = roundedFreqs(1,j):roundedFreqs(1, j+1)
			if (roundedFreqs(1, j+1) - roundedFreqs(1, j) == 0)
				filterbank(j, h) = 0;
			else
				filterbank(j, h) = (h - roundedFreqs(1, j))/(roundedFreqs(1, j+1) - roundedFreqs(1, j));
			end
		end
		for h = roundedFreqs(1,j+1):roundedFreqs(1, j+2)
			if (roundedFreqs(1, j+2) - roundedFreqs(1, j+1) == 0)
				filterbank(j, h) = 0;
			else
				filterbank(j, h) = (roundedFreqs(1, j+2) -h)/(roundedFreqs(1, j+2) - roundedFreqs(1, j+1));
			end
		end
    end
end

function f = mel(f)
	f = 1127*log(1 + f/700);
end

function h = imel(m) 
	h = 700*(e^(m/1125) -1);
end