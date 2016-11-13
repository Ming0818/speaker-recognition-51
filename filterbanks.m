function filterbank = filterbanks(frames) 

	low_freq = mel(300);
	high_freq = mel(4000);

	step = (high_freq - low_freq)/34;
	freqs = low_freq:step:high_freq;

	nfft = 160;

	%We don't have the frequency resolution required to put filters at the exact points calculated above, so we need to round those frequencies to the nearest FFT bin. This process does not affect the accuracy of the features. To convert the frequncies to fft bin numbers we need to know the FFT size and the sample rate
	roundedFreqs = zeros(size(freqs));
	for i = 1 : size(freqs)(2)
		roundedFreqs(1,i) = floor((nfft+1)*imel(freqs(1,i))/8000);
	end
	%Now we create our filterbanks. The first filterbank will start at the first point, reach its peak at the second point, then return to zero at the 3rd point. The second filterbank will start at the 2nd point, reach its max at the 3rd, then be zero at the 4th etc. A formula for calculating these is as follows
	filterbank = zeros(33,nfft);
	for j = 1 : 33
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