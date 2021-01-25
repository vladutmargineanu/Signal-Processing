% semnalul puls il generam
T = 100;
A = 1;
delta = T / 5;
t = 0 : T;
s = zeros(1, length(t));
% delta ensantioane nu sunt 0
s(1 : delta) = A;
plot(t, s);

% calculam primii coef fourier ck pozitivi
N = 30;
ck = zeros(1, N);
for k = 1 : N
  ck(k) = A * exp(-1j * pi * k * delta / T) * (delta / T) * sinc(k * delta / T);
end
figure();
plot(1 : N, ck, 'r');

% calc coef fourier de output
fc = 10 / T; % filtrare slaba
ckout = zeros(1, N);
for k = 1 : N
  ckout(k) = ck(k) / (1 + 1j * (1 / fc) * (k / T));
end
hold on;
plot(1 : N, ckout, 'b');

% Aproximarea sN(t) este dat? de primii termeni din Seria Fourier
sout = 0;
for k = 1 : N
  sout += ckout(k) * exp(1j * 2 * pi * k * t / T);
end
figure();
plot(t, sout, 'm');
