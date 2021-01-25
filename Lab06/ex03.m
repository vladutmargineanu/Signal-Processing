close all;
f = 1000;
N = 5000;
t = linspace(0, 10, N);
s = sin(2 * pi * f * t);
figure();
stem(t, s);

% semnalul digital
N_digital = N / 100;
t_digital = t(1 : 100 : end);
s_digital = sin(2 * pi * f * t_digital);
figure();
stem(t_digital, s_digital);

% un semnal continuu (analog)
s_cont = zeros(1, N);

for i = 1 : N_digital
  s_cont(i * 100) = s_digital(i);
end
figure();
plot(t, s_cont);

% convolutie
samples_digital = 10;
N_sinc = N;
t_sinc = linspace(-0.2, 0.2, N_sinc / 10);
sincvec = sinc(samples_digital * t_sinc);
s_cont_filtered = conv(s_cont, sincvec);
figure();
plot(s_cont_filtered, 'y');
