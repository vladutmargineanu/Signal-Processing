close all;

% diferite frecvente pentru sinusoida
f = [1, 2, 10, 20, 100];
N = 128;
t = linspace(0, 1, N);
medie = 0.2;

for i = 1 : 5
  % valoare de iesire y
  y = zeros(1, N);
  % esantion de intrare x
  x = sin(2 * pi * f(i) * t);
  % N - numar de esantionare
  % de la al 5-lea e?antion am câte 5 e?antioane la îndemân?
  for j = 5 : N
    % media celor 5 esantioane
    y(j) = (x(j - 4) + x(j - 3) + x(j - 2) + x(j - 1) + x(j)) * medie;
  end
  
  figure();
  % secventa de iesire
  plot(t, y, 'b');
  hold on;
  % secventa de intrare
  plot(t, x, 'm');
end