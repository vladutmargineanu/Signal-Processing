% ex 03 - DFT leakage ?i ferestre 
clear all; 
close all;
load('notes_signal_long.mat');

% 1- plota?i semnalul
[row, N] = size(notes_signal);
t = [0:N-1];

figure 1;
plot(t, notes_signal);
title('Semnal Initial');

% 2 - Calcula?i DFT pentru semnal 
t_fft = linspace(0, fs/2, N/2);
semnal_fft = fft(notes_signal);
semnal_fft_jumate = semnal_fft(1:N/2);

figure 2;
stem(t_fft, abs(semnal_fft_jumate));
title('DFT - semnal original');

% 3 - vom aplica semnalului o func?ie fereastr? 'Hanning'

window_hann = hann(N);
figure 3;
plot(window_hann);
title('Window Hanning');

s_hann = notes_signal .* window_hann';
figure 4;
plot(s_hann);
title('semnal original cu Hanning');

figure 5;
stem(linspace(0, fs/2, N), abs(fft(s_hann)));
title('DFT - semnal cu hanning');
% note muzicale
sound_in = audioplayer(notes_signal, fs);
play (sound_in);





