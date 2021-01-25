load('lab05_modulated_sound.mat');

t = 0 : 1/Fs : length(y0_modulated) / Fs;
fs = fft(y0_modulated);
stem([1:500], abs(fs)(1:500));