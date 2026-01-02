A = [ 5, -1, -1,  0,  0;
     -1,  5, -1, -1,  0;
     -1, -1,  4, -1, -1;
      0,  0,  1,  4, -2;
      0,  1, -1,  1,  4];
b = [-1; 2; 6; 2; -1];

% 1. METODE GAUSS
tic;
Ag = [A b];
n = length(b);
for i = 1:n-1
    for j = i+1:n
        m = Ag(j,i) / Ag(i,i);
        Ag(j,:) = Ag(j,:) - m * Ag(i,:);
    end
end
x_gauss = zeros(n,1);
x_gauss(n) = Ag(n,end)/Ag(n,n);
for i = n-1:-1:1
    x_gauss(i) = (Ag(i,end) - Ag(i,i+1:n)*x_gauss(i+1:n)) / Ag(i,i);
end
t1 = toc;

% 2. METODE GAUSS-JORDAN
tic;
Agj = [A b];
for i = 1:n
    Agj(i,:) = Agj(i,:) / Agj(i,i);
    for j = 1:n
        if i ~= j
            Agj(j,:) = Agj(j,:) - Agj(j,i) * Agj(i,:);
        end
    end
end
x_gj = Agj(:,end);
t2 = toc;

% 3. DEKOMPOSISI LU
tic;
[L, U] = lu(A);
y = L\b;
x_lu = U\y;
t3 = toc;

% Pengaturan Iterasi
tol = 0.001;
max_iter = 20;
x_awal = zeros(5,1);

% 4. JACOBI
tic;
x_jac = x_awal;
for k = 1:max_iter
    x_lama = x_jac;
    for i = 1:n
        sigma = A(i,:) * x_lama - A(i,i) * x_lama(i);
        x_jac(i) = (b(i) - sigma) / A(i,i);
    end
    if norm(x_jac - x_lama, inf) < tol, break; end
end
t4 = toc;

% 5. GAUSS-SEIDEL
tic;
x_gs = x_awal;
for k = 1:max_iter
    x_lama = x_gs;
    for i = 1:n
        sigma = A(i,:) * x_gs - A(i,i) * x_gs(i);
        x_gs(i) = (b(i) - sigma) / A(i,i);
    end
    if norm(x_gs - x_lama, inf) < tol, break; end
end
t5 = toc;

disp('Hasil Gauss:'); disp(x_gauss');
disp('Hasil Gauss-Jordan:'); disp(x_gj');
disp('Hasil LU:'); disp(x_lu');
disp('Hasil Jacobi:'); disp(x_jac');
disp('Hasil Gauss-Seidel:'); disp(x_gs');

error_jacobi = abs(x_lu - x_jac);
error_gs = abs(x_lu - x_gs);

disp('Galat Jacobi:'); disp(error_jacobi');
disp('Galat Gauss-Seidel:'); disp(error_gs');

disp('Running Time (detik):');
fprintf('Gauss: %.6f\nGJ: %.6f\nLU: %.6f\nJacobi: %.6f\nGS: %.6f\n', t1, t2, t3, t4, t5);
