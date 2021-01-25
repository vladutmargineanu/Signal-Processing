T = [0:0.01:1];
S = sin(2 * pi * T);

T2 = [0:0.02:2];


plot(T, S, T2, S, "m");
xlabel("T");
ylabel("sin(x)");
title("Sinusoida");
legend("unu", "doi");
