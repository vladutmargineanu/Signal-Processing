#t = 0 : 0.01 : 1;
# f2 - f1
t = 0 : 0.00001 : (1 / 200);

f1 = 1600;
f2 = 1800;

#A1 = 1;
A1 = 2;
x1 = A1 * sin(2 * pi * f1 * t);

#A2 = 1;
A2 = 3;
x2 = A2 * sin(2 * pi * f2 * t);

plot(t, x1, 'r');
hold on;
plot(t, x2, 'b');

figure
plot(t, x1 + x2)
xlabel('Time');
ylabel('Signal');
title('Two signals');