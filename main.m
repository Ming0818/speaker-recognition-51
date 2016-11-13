function main
	[s,fs] = wavread('./samples/edu.wav');
	mfcc(s);
	%talkers = ['meli.wav', 'fran.wav', 'angie.wav', 'edu.wav', 'adri.wav', 'lei.wav', 'agus.wav'];
	%for i = 1:size(talkers)
	%	[s,fs] = wavread(strcat('./samples/', talkers[i]));

		%mfcc(s);
	%end	
end