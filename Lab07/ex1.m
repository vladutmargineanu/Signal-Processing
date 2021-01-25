% Exercitiul 1

load('noisy_signal.mat')
N = 128;  # esantioane
fs = N;   # frecventa de esantionare
k_max = N; # frecventa maxima
t = [0:N-1];
t2 = [0:N/2 - 1];

% cerinta 1 - plotam semnalul zgomotos si spectrul

figure 1
clf
hold on
plot(t, noisy_signal);
title("Semnalul zgomotos");

figure  2
clf
hold on
stem(t2, abs(noisy_signal(1:N/2)));
title("Spectrul semnalului zgomotos");

% cerinta 2 - dft cu formula din lab, fft

signal_dft = zeros(1, N);
signal_fftshift = zeros(1, N);
signal_fft = zeros(1, N);

% calculez fft cu formula MATLAB si fac fftshift pe rezultatul de la fft 
signal_fft = fft(noisy_signal);
signal_fftshift = fftshift(signal_fft);

% calculez dft cu formula data in lab
for k = [0: k_max - 1]
  for n = [1:N]
    termen_dft = noisy_signal(n) * exp(-j * 2 * pi * n * k/k_max);
    signal_dft(k + 1) = signal_dft(k + 1) + termen_dft;
  endfor
endfor

figure  3
clf;
hold on;
stem(t, abs(signal_fft));
title("Spectrul fft");

figure  4
clf;
hold on;
stem(t, abs(signal_dft));
title("Spectrul dft");

figure  5
clf;
hold on;
stem(t, abs(signal_fftshift));
title("Spectrul fftshift");
 
% cerinta 3 - calcul SNR ca raport power_signal/power_noisy
power_signal = 0;
power_noisy = 0;

% calculez puterea semnalului util

% componenta frecventelor pozitive
k_pozitiv = 9;
for k = [0:k_pozitiv]
  power_signal = power_signal + power(abs(signal_dft(k+1)), 2);
endfor

% componenta frecventelor negative
for k = [N-9:N-1]
  power_signal = power_signal + power(abs(signal_dft(k+1)), 2);
endfor

power_signal = power_signal/(k_pozitiv * 2 + 1); % 19

% calculez puterea zgomotului
for k = [0:N-1]
  power_noisy = power_noisy + power(abs(signal_dft(k+1)), 2);
endfor

power_noisy = power_noisy / N;

% calculez raport semnal/zgomot

raport = power_signal/power_noisy;
printf("Raport semnal/zgomot: %f\n", raport);

% cerinta 4 - echivalent in dB

SNR_dB = 10 * log10(power_signal/power_noisy);
printf("Echivalent in dB: %f\n", SNR_dB);

for i = [k_pozitiv:N-k_pozitiv]
  signal_fft(i) = 0;
endfor

% calculez IDFT
signal_idft = zeros(1, N);

for n = [0: k_max - 1]
  for k = [1:N]
    termen_idft = signal_dft(k) * exp((j * 2 * pi * k * n)/k_max);
    signal_idft(n + 1) = signal_idft(n + 1) + termen_idft;
  endfor
    signal_idft(n + 1) = signal_idft(n + 1) / k_max;
endfor

figure 6
clf;
hold on;
plot(t, ifft(signal_fft), 'r');
plot(t, signal_idft, 'b');
title("ifft rosu si idft cu formula");
