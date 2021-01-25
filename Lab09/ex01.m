# ex 01

clear all;
close all;

# 1 - cate elemente are secventa prin convolutie
N = 8;
K = 8;
x = [1:8];   % 8 elemente
k = [1:3];   % 3 elemente

res_conv = conv(x, k);
[r, c] = size(res_conv);
printf("Secventa are:%d \n", r + c - 1); # M + N - 1 = 10

# 2 - Scrie?i fiecare dintre aceste elemente ca un produs scalar
x = [1, 3, 5, 7, 5, 4, 2];
h = [0.1, 0.3, 0.1];
% doar elementele care se inmultesc cu filtrul
res_conv2 = [x(1:3) * h', x(2:4) * h', x(3:5) * h', x(4:6) * h', x(5:7) * h'];
[r2, c2] = size(res_conv2);
printf("Secventa are:%d \n", r2 + c2 - 1); # M + N - 1

# 3 - Genera?i aceste secven?e ?i implementa?i convolu?ia
N = 64;
fs = 64000; 
f = 3000; 
h = [0.1, 0.2, 0.2, 0.2, 0.1];
A = 1;
x_t = 0:(N-1);

x = A*sin(2*pi*f/fs*x_t);

M = length(h);
size_conv = N - M + 1;

y1 = func_conv(x, h, size_conv);

y2 = conv(x, h);

figure 1;

stem(0:(N-1), x, 'm');
hold on;
stem(1:size_conv, y1, 'b');
hold on;
stem(1:size_conv, y2(1:size_conv), 'r');

title('Sinusoida-m VS Implementare conv-b VS functia conv-r');

# 4 -  secven?a de impuls cu 9 elemente
x = [0, 0, 0, 0, 1, 0, 0, 0, 0];
N3 = length(x);
size_conv3 = N3 - M + 1;
y3 = func_conv(x, h, size_conv3);

figure 2
stem(y3);

hold on;

stem(conv(x,h));
