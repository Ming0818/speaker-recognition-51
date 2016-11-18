function main

  subjects = ['Ale'; 'Angie' ;'Copi'; 'Dani'; 'Gabi';'Mechi'; 'Fran'; 'Meli';'Fede'; 'Agus'];
  subjectsVqs = zeros(26, 16, size(subjects)(2));
  subjectsSize = size(subjects)(1);

  % Se entrena con los audios en samples/training
  for i = 1 : subjectsSize

    printf('Leyendo el audio de %s\n', subjects(i, :));
    fflush(stdout);

    [s,fs] = wavread(strcat('./samples/training/', subjects(i,:), '.wav')); 
    mfccCoef = mfcc(s);
    subjectsVqs(:,:,i) = vq(mfccCoef', 16);
  end

  testSize = 0;
  correctSize = 0;

  % Se testean los audios en samples/test
  for i = 1 : subjectsSize

    [s,fs] = wavread(strcat('./samples/test/', subjects(i,:), '01.wav'));
    mfccCoef = mfcc(s);

    for j = 1 : subjectsSize
      aux = meandist(mfccCoef', subjectsVqs(:,:,j));

      if (j == 1 || aux < distance)
        subject = subjects(j,:);
        distance = aux;
      end

    end

    testSize++;
    if (subject == subjects(i,:))
      correctSize++;
    end

    printf('Se ha detectado a %s en el audio de %s\n', subject, subjects(i,:));
    fflush(stdout);

  end
  
  for i = 1 : subjectsSize

    [s,fs] = wavread(strcat('./samples/test/', subjects(i,:), '02.wav'));
	  mfccCoef = mfcc(s);

    for j = 1 : subjectsSize
      aux = meandist(mfccCoef', subjectsVqs(:,:,j));

      if (j == 1 || aux < distance)
        subject = subjects(j,:);
        distance = aux;
      end
    end

    testSize++;
    if (subject == subjects(i,:))
      correctSize++;
    end

    printf('Se ha detectado a %s en el audio de %s\n', subject, subjects(i,:));
    fflush(stdout);
  end

  printf('Se testearon %d muestras y se reconocieron correctamente %d\n', testSize, correctSize);
  printf('Efectividad del algoritmo del %f por ciento\n', (correctSize / testSize) * 100);
  fflush(stdout);
end