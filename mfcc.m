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
   
	powerFrames = zeros(size(fft_hframes));
	powerFrames = (1/size(frames)(2))*(abs(fft_hframes).^2);

	%Filterbanks
	filterbanks = filterbanks(fft_hframes);

	%Filterbancks energies

	%Tomamos solo los primeros 17 filtebancks para ASR.
	filteredFramesPower = zeros(size(powerFrames)(1), 33);

  for i = 1: size(powerFrames)(1)
	  for j = 1: 33
			filteredFramesPower(i, j) = filterbanks(j, :) * powerFrames(i,:)';
		end
	end

  size(filteredFramesPower)
  tic()
  melCeptrums = melCeptrums(filteredFramesPower)
  toc()
  size(melCeptrums)

  
	%filterbankLogEnergies = log(filteredFramesPower);
  
  
  
	%dctLogFilterbanks = dct2(filterbankLogEnergies);

	%size(dctLogFilterbanks)
	%size(fft_hframes)
	%filteredFrames = filterbanks*fft_hframes;


end