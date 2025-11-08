% Nama : Kevin Ananda Putra
% NIM  : L0124103

x = 1;
eksak = sin(x);
n = [1, 2, 3, 4, 5];

fprintf('Nilai eksak (%.0f) = %.15f\n\n', x, eksak);
fprintf('%-4s %-20s %-20s\n', 'n', 'Pendekatan Taylor', 'Galat');

for i = 1:length(n)
    N = n(i);
    approx = 0;

    for k = 0:N
        approx = approx + ((-1)^k * x^(2*k + 1)) / factorial(2*k + 1);
    end

    galat = abs(eksak - approx);

    fprintf('%-4d %-20.15f %-20.15f\n', N, approx, galat);
end
