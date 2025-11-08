% Nama : Kevin Ananda Putra
% NIM  : L0124103

% a
answer1 = 0;
for i = 1:20
    answer1 = answer1 + (1/i);
end

% b
answer2 = 0;
for i = 1:20
    pembulatan = round((1/i)*100)/100;
    answer2 = answer2 + pembulatan;
end

deret = 1./(1:20);
answer3 = sum(deret);

galatA = abs(answer1 - answer1);
galatB = abs(answer1 - answer2);
galatC = abs(answer1 - answer3);

fprintf('a. Hasil perhitungan eksak: %.10f\n', answer1);
fprintf('   Galat: %.10f\n\n', galatA);
fprintf('b. Hasil perhitungan dengan pembulatan: %.10f\n', answer2);
fprintf('   Galat: %.10f\n\n', galatB);
fprintf('c. Hasil perhitungan tanpa loop: %.10f\n', answer3);
fprintf('   Galat: %.10f\n\n', galatC);
