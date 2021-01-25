N = 20;
y = zeros(1, N);
y(1) = 7;

#valoarea ini?ial? pentru secven?a de diferen??
e = zeros(1, N);

for i = 1 : N - 1
  e(i) = 60 - y(i);  
  y(i + 1) = S1(y(i), e(i));
end

y

plot(y, 'r');
hold on;
plot(e, 'b');