close all;
clear all;

% ex 01
input_imag = imread('peppers.png');
figure 1;
imshow(input_imag);
title('Poza originala');

input_imag_grey = rgb2gray(input_imag);
figure 2;
imshow(input_imag_grey );
title('Poza alb-negru');

dblImage2 = im2double(input_imag_grey);

figure 3;
imshow(dblImage2);
title('Valorile transformate in double');

% ex02
imag_spectru = fft2(dblImage2);
final_imag_spectru = fftshift(imag_spectru);
figure 4;
plot(final_imag_spectru, 'm');
title('Spectrul imaginii');

% ex3
img_ifft = ifft2(imag_spectru);

dmin = min(min(abs(img_ifft)));
dmax = max(max(abs(img_ifft)));
figure 5;
imshow(img_ifft, [dmin dmax]);
title('Reconstruim imaginea cu ifft2');

% ex 5
min_S = min(img_ifft(:));
max_S = max(img_ifft(:));

% ex 4
S_norn = (img_ifft - min_S) / (max_S - min_S);
figure 6;
imshow(S_norn);
title('Normalizarea imaginii reconstruite cu ifft2');
