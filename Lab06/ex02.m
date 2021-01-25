close all;

f = 3000;  # frecventa purtatoare
fs = 8000; # frecventa de sampling
% perioada de esantionare
Ts = (1 / fs);
t = [0 : Ts : (100 * Ts)];
N = 64;

% Semnalul continuu filtrat > 2 * frecventa de taiere din filtrul trece jos 
% Fs > 2 * B aliasing
% Pentru a evita coruperea semnalului datorita fen de aliasing
% band pass sampling
% fs = fc - B/2

% semnal original
s = sin(2 * pi * f * t);
figure();
plot(t, s, 'y');

% Transformata Fourier esantionata
spectrum = fft(s, N);

frecv = (fs/N) * linspace(0,N-1,N);
figure();
stem(frecv, abs(spectrum));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectrum of s');

% recuperare semnal prin aplicare unui filtru trece-jos
% se foloseste band pass sampling - low pass filter
figure();
frecv_shift = (fs/N)*linspace(-N/2, N/2-1, N);
stem(frecv_shift, abs(fftshift(spectrum)));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Zero-centred frequency spectrum of s');
% w - window
% Fc > 2 * w
% frecventa de sampling pe care o putem folosi pentru convertirea in domeniul digital
# B - nr biti pt cuantizare
