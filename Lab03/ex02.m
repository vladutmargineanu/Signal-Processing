% Construim semnalul dreptunghiular cu numar limitat de coeficienti
T = 100;
time = 0 : 1 : T;
A = 3;
s = zeros(1, length(time));

% ex 1
for i = 1 : length(time)
   if i < T / 2  %50
       s(i) = A;
   else
       s(i) = -A;
   end
end
plot(time, s, 'r');

% ex 2 
% Calculam coeficientii Fourier
kmax = 49;
kmin = -49;
indice = kmin : kmax;
ck = zeros(1, length(indice));

for i = 1 : length(indice)
   if mod(i, 2) != 0  % k impar
        ck(i) = 2 * A / (1j * pi * indice(i));
   else
        ck(i) = 0;    % k par
   end
end

figure();
% reprezentam magnitudinea => abs
stem(abs(ck));
figure();
plot(time, s);
ylim([-A-1, A+1]);
hold on;

% ex 3
% reconstruim semnalul s(t) cu formula din curs

s_t = zeros(1, length(s));

for i = 1 : length(time)
  for j = 1 : length(indice)
    s_t(i) += ck(j) * exp((1i * 2 * pi * indice(j) * i) / T);
  end
end
plot(time, s_t, 'b');
