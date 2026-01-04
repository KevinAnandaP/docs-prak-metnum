f1 = @(x) x^2 - 5;
df1 = @(x) 2*x;
tol = 1e-5;
max_n = 20;

% Pendekatan grafik untuk nilai awal
a = 2; b = 3; x0 = 2; x1 = 3;

fprintf('=== SOAL 1a: f(x) = x^2 - 5 ===\n');

% Newton-Raphson
tic; x_nr = x0; iter_nr = 0;
for i = 1:max_n
    x_new = x_nr - f1(x_nr)/df1(x_nr);
    iter_nr = i;
    if abs(x_new - x_nr) < tol, x_nr = x_new; break; end
    x_nr = x_new;
end
t_nr = toc;
fprintf('Newton-Raphson: Akar = %.6f, Iterasi = %d, Waktu = %.6f s\n', x_nr, iter_nr, t_nr);

% Secant
tic; x_sec0 = x0; x_sec1 = x1; iter_sec = 0;
for i = 1:max_n
    x_new = x_sec1 - (f1(x_sec1)*(x_sec1 - x_sec0))/(f1(x_sec1) - f1(x_sec0));
    iter_sec = i;
    if abs(x_new - x_sec1) < tol, x_sec1 = x_new; break; end
    x_sec0 = x_sec1; x_sec1 = x_new;
end
t_sec = toc;
fprintf('Secant        : Akar = %.6f, Iterasi = %d, Waktu = %.6f s\n\n', x_sec1, iter_sec, t_sec);

f2 = @(x) x^2 + sin(x) - 10;
% Variasi g(x) untuk Iterasi Titik Tetap
g1 = @(x) sqrt(10 - sin(x));
g2 = @(x) asin(10 - x^2);

x_start = 2;
fprintf('=== SOAL 2: Fixed Point Iteration ===\n');

% Variasi 1
tic; x_g1 = x_start; iter_g1 = 0;
for i = 1:max_n
    x_new = g1(x_g1);
    iter_g1 = i;
    if abs(x_new - x_g1) < tol, x_g1 = x_new; break; end
    x_g1 = x_new;
end
t_g1 = toc;
fprintf('Variasi 1 g(x)=sqrt(10-sin(x)): Akar = %.6f, Iterasi = %d, Waktu = %.6f s\n', x_g1, iter_g1, t_g1);

% Variasi 2
tic; x_g2 = x_start; iter_g2 = 0;
for i = 1:max_n
    try
        x_new = g2(x_g2);
        iter_g2 = i;
        if abs(x_new - x_g2) < tol, x_g2 = x_new; break; end
        x_g2 = x_new;
    catch
        fprintf('Variasi 2 g(x)=asin(10-x^2)  : Divergen/Error pada iterasi %d\n', i);
        break;
    end
end
t_g2 = toc;
if iter_g2 == max_n, fprintf('Variasi 2: Mencapai max iterasi tanpa konvergensi.\n'); end
