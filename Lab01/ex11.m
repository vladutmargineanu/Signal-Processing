T = [0:0.01:1];
S = sin(2 * pi * T);
figure;
plot(T, S, "m");

T2 = [0:0.02:1];
S2 = sin(2 * pi * T2);
figure;
plot(T2, S2, "y");

%================ ???
T3 = T + T2;

figure;
plot(T3, S, "r");

