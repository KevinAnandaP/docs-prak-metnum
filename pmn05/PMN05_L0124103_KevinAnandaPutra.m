f1 = @(x) 3*x.^3 - 5*x.^2 + 4*x - 7 - 1;
f2 = @(x) exp(x) - x.^2;
f3 = @(x) log(x + 2) + 2*x - 3;

x_range = -2:0.1:4;

figure(1);
subplot(3,1,1); plot(x_range, f1(x_range)); grid on; title('Grafik Fungsi 1');
subplot(3,1,2); plot(x_range, f2(x_range)); grid on; title('Grafik Fungsi 2');
subplot(3,1,3); plot(x_range, f3(x_range)); grid on; title('Grafik Fungsi 3');

funcs = {f1, f2, f3};
brackets = [1.5, 2.0; -1.0, 0.0; 1.0, 2.0];
tol = 0.0001;
max_iter = 20;

for k = 1:length(funcs)
    f = funcs{k};
    a = brackets(k,1); b = brackets(k,2);
    fprintf('\n--- Persamaan %d ---\n', k);

    % Biseksi
    a_bis = a; b_bis = b;
    for i = 1:max_iter
        c = (a_bis + b_bis) / 2;
        if abs(f(c)) < tol || (b_bis - a_bis)/2 < tol, break; end
        if f(a_bis) * f(c) < 0, b_bis = c; else, a_bis = c; end
    end
    fprintf('Biseksi: Akar = %.6f, Iterasi = %d\n', c, i);

    % Regula-Falsi
    a_rf = a; b_rf = b;
    for i = 1:max_iter
        c = b_rf - (f(b_rf) * (b_rf - a_rf)) / (f(b_rf) - f(a_rf));
        if abs(f(c)) < tol, break; end
        if f(a_rf) * f(c) < 0, b_rf = c; else, a_rf = c; end
    end
    fprintf('Regula-Falsi: Akar = %.6f, Iterasi = %d\n', c, i);
end
