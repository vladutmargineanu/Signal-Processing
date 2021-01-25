% ex 02 - DFT leakage ?i ferestre 
clear all; 
close all;
load('notes_signal.mat');

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

% incercam cu zero-padding N = 64
zeros_add = zeros(1, 32);
s_add = semnal_fft_jumate;
s_add = [s_add, zeros_add];

s_add_fft = fft(s_add);
figure 3;
stem(linspace(0, fs/2, N), abs(s_add_fft));
title('zero padding DFT- semnal original');

window_hann = hann(N);
figure 4;
plot(window_hann);
title('Window Hanning');

s_hann = notes_signal .* window_hann';
figure 5;
plot(s_hann);
title('semnal original cu Hanning');

figure 6;
stem(linspace(0, fs/2, N), abs(fft(s_hann)));
title('DFT - semnal cu hanning');






