t = [0, pi/6, pi/4, pi/3, pi/2];
s1 = exp(1i * t);
plot(s1, 'ro');
hold on;

s2 = exp(-1i * t);
plot(s2, 'bo');
hold on;

ss = (s1 + s2) / 2;
real(ss)
imag(ss)
plot(real(ss), imag(ss), 'mo');