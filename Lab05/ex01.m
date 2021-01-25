A = 1;
T = 100;
kmax = 81;
t = [1:100];

#semnal dreptunghiular
s = [A * ones(1, T/2), -A * ones(1, T/2)];

figure 1
clf
hold on

# reprezentam semnalul original
plot(t, s);
xlim([-4, T + 3]);
ylim([-A - 0.4, A + 0.4]);

# calculam coef fourier ck, k = 81
ck = zeros(1, 2 * kmax + 1);
ck_delay = zeros(1, 2 * kmax + 1);

for k = [-kmax:kmax]
	if (mod(k, 2) == 1)
		ck(k + kmax + 1) = (2 * A) / (j * pi * k);
    # s (t ? ? ) = e ^ (?j2?f ?)  * S (f)
		ck_delay(k + kmax + 1) = ck(k + kmax + 1) * exp(-j * 2 * pi * k * (1/T) * (T/4));
	end
end

figure 2
clf
hold on

# plotam modulul coef cu stem
stem([-kmax:kmax], abs(ck));
# plotam coef dupa modificare - sunt la fel
stem([-kmax:kmax], abs(ck_delay));

figure 3
clf
hold on
# faza semnalului intarziat creste - este mai mare
stem([-kmax:kmax], rad2deg(angle(ck)));
stem([-kmax:kmax], rad2deg(angle(ck_delay)));

s_delay = zeros(1, T);

# reconstruiesc semnalul din spectrul modificat
for i = 1:T
    for k = -kmax:kmax
        s_delay(i) += ck_delay(k + kmax + 1) * exp(j * (2 * pi * k * i) / T);
    end
end

figure 1
plot(t, s_delay)