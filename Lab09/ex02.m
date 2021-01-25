% ex 02

clear all;
close all;

# 1 - secven?? de filtru ideal trece-jos HK
N = 256;
fs = N;
f_cutoff = fs/16;
t = linspace(0, 1, fs);

hk = zeros(1, N);
hk(1:f_cutoff) = 1;
hk(N - f_cutoff:N) = 1;

figure 1;
plot(t, hk);
ylim([-0.2,1.2])

title('Ideal low-pass filter');

# 1 - aplica?i inversa DFT
hk_invers = ifftshift(ifft(hk));
figure 2
plot(t, hk_invers);
title('IFFT sinc - Ideal low-pass filter');

# 2 - Trunchia?i secven?a hk(n)
L = 65;
% 32 in stanga, 1 max, 32 in dreapta => 65 elemente
h_trunchiat = hk_invers(N/2+1-32:N/2+1+32);
figure 3;
plot(1:L, h_trunchiat);
title('Functia sinc trunchiata');

# 3 - fft pe secven?a trunchiat? înmul?it? cu fereastra rectangular?
h_trunchiat_fft = fft(h_trunchiat);
L = 65;
f_t = linspace(0, 1, L);
figure 4
plot(f_t, fftshift(real(h_trunchiat_fft)));
title('Efectele ferestrei dreptunghiulare');

# 4 - inmultim cu fereastra blackman
window_blackman = blackman(L);
h_trunchiat_blackman = h_trunchiat .* window_blackman';

figure 5;
plot(1:L, window_blackman);
title('Fereastra blackman');

h_trunchiat_blackman_fft = fft(h_trunchiat_blackman);

figure 6;
plot(f_t, fftshift(real(h_trunchiat_blackman_fft)));
title('FFT Blackman');

% 5 - folosi?i ca intrare sinusoida din Exerci?iul 1
N = 64;
fs = 64000; 
f = 3000; 
A = 1;
x_t = 0:(N-1);

x = A*sin(2*pi*f/fs*x_t);
y_final = conv(x, h_trunchiat_blackman_fft);

figure 7;
stem(x_t, x, 'r');
hold on;
stem(x_t, real(y_final(1:N)), 'm');
legend('x - sinusoida', 'y_final - conv');


