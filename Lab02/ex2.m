N = 200;
T = 100;
x = 1 : N;

s1 = ramp(N);
plot(x, s1, 'g');
hold on;

s2 = -[zeros(1, T), s1(1: N - T)];
plot(x, s2, 'b');
hold on;

s3 = [zeros(1, T), - T .* ustep(N - T)];
plot(x, s3, 'r');
hold on;

sum = s1 + s2 + s3;
plot(x, sum, 'k');