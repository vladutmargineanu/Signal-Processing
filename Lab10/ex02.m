close all;
clear all;

% ex 1
input_imag = imread('stego_img.bmp');

F = fft2(double(input_imag));
S = abs(fftshift(F));
figure 1;
S_log = log(S);
imagesc(log(S));
title('imaginia cu fft2');

% ex 3
img_ifft = ifft2(S);

% s = std(S(:));
% u = mean(S(:));
min_S = min(S_log(:));
max_S = max(S_log(:));

% ex 4
S_norn = (S_log - min_S) / (max_S - min_S);
figure 2;
imshow(S_norn, [min_S, max_S]);
% imshow(S_norn);
title('Normalizarea imaginii');
