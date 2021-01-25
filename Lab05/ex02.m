a = 0.05;
T = 128;
t = [1:T];

# plotam semnalul s exponential
s = exp(-a * t);

figure 1
clf
hold on
plot(t, s);

kmax = T;

S = zeros(1, kmax);

# calculam semnalul s cu DFT discreta
for k = 0: kmax - 1
	for n = 1:T
		S(k+1) += s(n) * exp(-j * 2 * pi * n * k / kmax);
	end
end

# stem de semnalul s cu DFT
figure 2
clf
hold on
stem([0:kmax - 1], abs(S));

# calculam semnalul x cu IDFT discreta inversa

x = zeros(1,T);

for n = [1:T]
	for k = 0: kmax - 1
		x(n) += S(k+1) * exp(j * 2 * pi * n * k / kmax);
	end
	x(n) /= kmax;
end

figure 3
clf
hold on
plot(t, x);

figure 4
clf
hold on

# calcula?i cu ajutorul FFT
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(s);
stem([0:kmax-1], abs(fs));

# modulare semnal în amplitudine folosind frecven?a purt?toare
fc = 20/T;
y = zeros(1, T);

for i = 1:T
	y(i) = (1 + s(i)) * cos(2 * pi * fc * i);
end

figure 3
plot(t, y);

# Calcula?i ?i plota?i (cum am f?cut mai devreme, cu func?ia fft)
# spectrul semnalului modulat în amplitudine. Compara?i-l cu spectrul semnalului original
figure 4
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(y);
stem([0:kmax-1], abs(fs));
