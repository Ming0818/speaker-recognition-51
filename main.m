function main
  
  %Entrenamiento
  subjects = ["adri"; "agus" ;"angie"; "edu"; "fran"; "jose"; "juan"; "lei"; "manuela"; "meli"];
  subjectsVqs = zeros(26, 16, size(subjects)(2));
  subjectsSize = 3;
  for i=1:subjectsSize
    [s,fs] = wavread(strcat('./samples/training/', subjects(i,:), '.wav'));
    printf("Leyendo el audio de %s\n", subjects(i, :));
    fflush(stdout);
	  mfccCoef = mfcc(s);
    subjectsVqs(:,:,i) = vq(mfccCoef', 16);
    meandist(mfccCoef', subjectsVqs(:,:,i));
   end
   for i=1:subjectsSize
    subject = 0;
    mean = -1;
    [s,fs] = wavread(strcat('./samples/test/', subjects(i,:), '01.wav'));
	  mfccCoef = mfcc(s);
    for j=1:subjectsSize
      aux = meandist(mfccCoef', subjectsVqs(:,:,j))
      if (subject == 0 || aux < mean)
        subject = subjects(j,:);
        mean = aux;
      end
    end
    printf("Se ha detectado a %s en el audio de %s\n", subject, subjects(i,:));
    fflush(stdout);
   end
   for i=1:subjectsSize
   
    subject = 0;
    mean = -1;
    [s,fs] = wavread(strcat('./samples/test/', subjects(i,:), '02.wav'));
	  mfccCoef = mfcc(s);
    for j=1:subjectsSize
      aux = meandist(mfccCoef', subjectsVqs(:,:,j))
      if (subject == 0 || aux < mean)
        subject = subjects(j,:);
        mean = aux;
      end
    end
    printf("Se ha detectado a %s en el audio de %s\n", subject, subjects(i,:));
    fflush(stdout);
   end
end