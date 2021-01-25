% Exercitiul 2
clear all 
close all

S = load('noisy_sound.mat');
s = S.noisy_sound;
fs = S.fs;  # frecventa de esantionare = 8000

N = length(s); # frecventa maxima
k_max = N;
t = [0:N-1];

sound(s)

figure 1
clf
hold on
plot(t, s);
title("Semnalul zgomotos");

%figure  2
%clf
%hold on
%stem(t, abs(s));
%title("Spectrul semnalului zgomotos");

%calcul dft
signal_dft = zeros(1, N);

%for k = [0: fs - 1]
%  for n = [1:N]
%    termen_dft = s(n) * exp(-j * 2 * pi * n * k/k_max);
%    signal_dft(k + 1) =  signal_dft(k + 1) + termen_dft;
%  endfor
%endfor

t2 = [0:fs/2-1];

signal_fft = zeros(1, N);
signal_fft = fft(s);

figure 3
clf 
hold on 
stem(t2, abs(signal_fft(1:fs/2)));
title('Spectrul fft');

% calcul SNR ca raport power_signal/power_noisy
power_signal = 0;
power_noisy = 0;

%calcul putere zgomot
% 500 = k * fs /N => k = 1500

k_pozitiv = 1500;

for k = k_pozitiv:N-1
  power_noisy = power_noisy + power(abs(signal_fft(k+1)), 2);
endfor

power_noisy = power_noisy / N;

% calculez puterea semnalului util

% componenta frecventelor pozitive
% 500 = k * fs /N => k = 1500
for k = [0:k_pozitiv]
  power_signal = power_signal + power(abs(signal_fft(k+1)), 2);
endfor

% componenta frecventelor negative
for k = [N-k_pozitiv:N-1]
  power_signal = power_signal + power(abs(signal_fft(k+1)), 2);
endfor

power_signal = power_signal/(k_pozitiv * 2 + 1);

% calculez raport semnal/zgomot

raport = power_signal/power_noisy;
printf("Raport semnal/zgomot: %f\n", raport);

SNR_dB = 10 * log10(power_signal/power_noisy);
printf("SNR_dB echivalent in dB: %f\n", SNR_dB);

s_idft = zeros(1, N);

for i = [k_pozitiv:N-k_pozitiv]
  signal_fft(i) = 0;
endfor

% 500 = k * fs /N => k = 1500
%for n = [0: N - 1]
%  for k = [1:fs-1]
%    termen_idft = signal_fft(k) * exp((j * 2 * pi * k * n)/fs);
%    s_idft(n + 1) =  s_idft(n + 1) + termen_idft;
%  endfor
%    s_idft(n + 1) = s_idft(n + 1) / k_max;
%endfor

% cu formula matlab IFFT
signal_ifft = zeros(1, N);
signal_ifft = ifft(signal_fft);

figure 4
clf 
hold on
plot(0:N-1, signal_ifft);
title("ifft");

sound(signal_ifft)

