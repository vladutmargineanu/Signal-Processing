% 01 - semnalul original
T = 100;
A = 1;
t = 1 : T;
s = A * ones(1, T);
s((T / 2 + 1) : T) = -A; 

plot(t, s);

% 02 - coeficien?ii Fourier ck 
k = 0 : 500;
ck = zeros(1, length(k));
for i = 1 : length(k)
  if mod(k(i), 2) != 0
    ck(i) = 2 * A / (1i * pi * k(i));  % semnalul dreptunghiular
  end
end

figure();
plot(k, abs(ck) .^ 2);

%03 rms pentru fiecare N  = 1:500

% 1) calculez coeficientii ck
k = 0 : 2000;  % plecam de la k = N+1 la inf
ck = zeros(1, length(k));
for i = 1 : length(k)
  if mod(k(i), 2) != 0
    ck(i) = 2 * A / (1i * pi * k(i));
  end
end

% 2) calculez rms -ul cu formula
K = 1 : 500;
sum = 0;
for i = K + 1 : k
  sum += abs(ck) .^ 2;
end
rms = sqrt(2 * sum);
figure();
plot(K, rms);