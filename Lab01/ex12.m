
load("data.mat","IR", "R1", "R2");

figure;
image(R1);

figure;
image(R2);

figure;
image(IR);

Imag_initial = (IR - R1 * 0.3 - R2 * 0.3) / 0.3;

figure;
image(Imag_initial);