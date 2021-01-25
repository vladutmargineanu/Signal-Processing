% ex 01 - DFT leakage ?i zero-padding

A1 = 1;           # amplitudinile
A2 = 0.5;
fs = 8000;  
f1 = 1000;        # frecventele sinusoidelor
f2 = 2000;      
N = 8;            # esantioane

t = [0:N-1];
s = zeros(1, N);  # semnalul compus
ts = 1/fs;        # perioada de esantionare

% cream semnalul
for i=1:N
    s(i) = A1 * sin(2*pi*f1*(i-1)*ts) + A2 * sin(2*pi*f2*(i-1)*ts);
end

s1 = A1 * sin(2*pi*f1*t*ts);
s2 = A2 * sin(2*pi*f2*t*ts);

% 1 - afisam semnalul original
figure 1;
plot(t, s);
hold on;
plot(t, s1);
hold on;
plot(t, s2);
hold on;
title('Semnalul original');

% (K *fs) / N
frecventa = (fs/N)*linspace(0, N-1, N);
% 2 - calculam dft pt semnalul
figure 2;
stem(frecventa, abs(fft(s)));
title('DFT semnal original');

% 1 - eliminare prima sinusoida

f1 = 0;

for i=1:N
    s(i) = A1 * sin(2*pi*f1*(i-1)*ts) + A2 * sin(2*pi*f2*(i-1)*ts);
end

figure 3;
plot(t, s);
title('Eliminare prima sinusoida');

figure 4;
stem(frecventa, abs(fft(s)));
title('Eliminare prima sinusoida - semnal la 2kHz');

% 2 - Schimba?i f2 de la 2kHz la f2=2500 Hz.
f2 = 2500;

for i=1:N
    s(i) = A1 * sin(2*pi*f1*(i-1)*ts) + A2 * sin(2*pi*f2*(i-1)*ts);
end

figure 5;
plot(t, s);
title('Semnal cu f2 = 2500 Hz');
% Ar trebui s? vedeti c? toat? energia de la frecven?a de 2.5kHz a fost distribuit? pe frecven?ele adiacente
% DFT LEAKAGE
figure 6;
stem(frecventa, abs(fft(s)));
title('DFT pentru f2 = 2500 Hz');

% 3 - Adaugare esantioane - zero padding
zeros_add = zeros(1, 56);
s_add = s;
s_add = [s_add, zeros_add];
% K=64  e?antioane, se vede sincul in jurul 2.5 kHz
figure 7;
stem(linspace(0, 8000, 64), abs(fft(s_add)));
title('DFT - Crestem numarul de esantioane - zero padding');

% 4 - schimbati din nou frecven?a la f2=2000 Hz
f2 = 2000;

for i=1:N
    s_add(i) = A1 * sin(2*pi*f1*(i-1)*ts) + A2 * sin(2*pi*f2*(i-1)*ts);
end
% sinc-ul de la e?antioanele de la 1000,3000,4000… sunt 0.
figure 8;
stem(linspace(0, 8000, 64), abs(fft(s_add)));
title('f2=2.5kHz - DFT - zero padding');


















