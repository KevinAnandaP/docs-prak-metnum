fa = @(x) x .* exp(2*x);
aa = -2; ba = 2;

fb = @(x) x.^2 + sin(2*x);
ab = 0; bb = 10;

fprintf('--- HASIL FUNGSI A ---\n');
eksak_a = integral(fa, aa, ba);
fprintf('Nilai Eksak: %.6f\n', eksak_a);

n_mid = 10;
h_mid = (ba - aa) / n_mid;
x_mid = aa + h_mid/2 : h_mid : ba - h_mid/2;
mid_a = h_mid * sum(fa(x_mid));
fprintf('Midpoint (n=10): %.6f\n', mid_a);

R = zeros(4,4);
h_rom = ba - aa;
R(1,1) = (h_rom/2) * (fa(aa) + fa(ba));
for i = 2:4
    h_rom = h_rom / 2;
    titik = aa + h_rom : 2*h_rom : ba - h_rom;
    R(i,1) = 0.5 * R(i-1,1) + h_rom * sum(fa(titik));
    for j = 2:i
        R(i,j) = R(i,j-1) + (R(i,j-1) - R(i-1,j-1)) / (4^(j-1) - 1);
    end
end
rom_a = R(4,4);
fprintf('Romberg: %.6f\n', rom_a);
fprintf('Galat Midpoint: %.6f\n', abs(eksak_a - mid_a));
fprintf('Galat Romberg: %.6f\n\n', abs(eksak_a - rom_a));

fprintf('--- HASIL FUNGSI B ---\n');
eksak_b = integral(fb, ab, bb);
fprintf('Nilai Eksak: %.6f\n', eksak_b);

h_mid_b = (bb - ab) / n_mid;
x_mid_b = ab + h_mid_b/2 : h_mid_b : bb - h_mid_b/2;
mid_b = h_mid_b * sum(fb(x_mid_b));
fprintf('Midpoint (n=10): %.6f\n', mid_b);

Rb = zeros(4,4);
h_rb = bb - ab;
Rb(1,1) = (h_rb/2) * (fb(ab) + fb(bb));
for i = 2:4
    h_rb = h_rb / 2;
    titik_b = ab + h_rb : 2*h_rb : bb - h_rb;
    Rb(i,1) = 0.5 * Rb(i-1,1) + h_rb * sum(fb(titik_b));
    for j = 2:i
        Rb(i,j) = Rb(i,j-1) + (Rb(i,j-1) - Rb(i-1,j-1)) / (4^(j-1) - 1);
    end
end
rom_b = Rb(4,4);
fprintf('Romberg: %.6f\n', rom_b);
fprintf('Galat Midpoint: %.6f\n', abs(eksak_b - mid_b));
fprintf('Galat Romberg: %.6f\n', abs(eksak_b - rom_b));
