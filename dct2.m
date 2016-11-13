%funcion extraida de https://www.mathworks.com/matlabcentral/newsreader/view_thread/706
function Y = dct2(X)

[M,N] = size(X);

for a = 1:M
   for b = 1:N

      sum1 = 0;

      for c = 1:M
         for d = 1:N

            sum1 = sum1+4*X(c,d)*cos(((2*pi*a)/M)*((c-1)+0.5))*cos(((2*pi*(b-1))/N)*((d-1)+0.5));

          end
       end

       Y(a,b) = sum1;

   end
end