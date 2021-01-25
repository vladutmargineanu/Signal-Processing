% secventa continua

v1 = 1:3;
v2 = [1:3];

%Crea?i o secven?? de 10 elemente, pornind de la 5.
v3 = [5:15];

v4 = [1:0.5:5];

%Concatenare vectori si matrici

a = [1, 2, 3, 4, 5, 6];
b = [1:2:12];
m = [a; b];

% Dimensiune vectori si matrice - functie

size_a = size(a);
size_m = size(m);

% Exercitiul 06
% Salvarea ?i înc?rcarea variabilelor

save('myfile02.m', 'v1', 'v2');
save myfile.m v3;
load myfile.m;
clear myfile.m;




