% Nama : Kevin Ananda Putra
% NIM  : L0124103

x = 0.3;
eksak = exp(0.3);
fprintf('Nilai eksak e^0.3 = %.15f\n', eksak);

n = [0, 1, 2, 3, 4];
fprintf('%-4s %-20s %-20s\n', 'n', 'Pendekatan Taylor', 'Galat');

for i = 1:length(n)
    j = n(i);

    approx = 0;
    for k = 0:j
        approx = approx + (x^k) / factorial(k);
    end

    galat = abs(eksak - approx);
    fprintf('%-4d %-20.15f %-20.15f\n', j, approx, galat);
end