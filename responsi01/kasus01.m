tic
time_var = linspace(0, 5, 500);
angle = time_var * 3;
h0 = 5;

h_exact = h0 * (cos(angle) + exp(10));

n_vals = [23, 24, 25];
h_approx = zeros(length(time_var), 3);

for idx = 1:3
  sum_cos = zeros(size(angle));
  sum_exp = 0;
  
  for k = 0:(n_vals(idx)-1)
    sum_cos = sum_cos + ((-1)^k * angle.^(2*k)) / factorial(2*k);
    sum_exp = sum_exp + (10^k) / factorial(k);
  end
  
  h_approx(:, idx) = h0 * (sum_cos + sum_exp);
end

avg_exact = mean(h_exact);
avg_approx = mean(h_approx);

fprintf('\n========== HASIL ==========\n');
fprintf('Nilai Exact : %.6f\n\n', avg_exact);

errors = zeros(1,3);
for i = 1:3
  fprintf('Pendekatan N=%d : %.6f\n', n_vals(i), avg_approx(i));
  errors(i) = abs(avg_exact - avg_approx(i));
end

fprintf('\n');
for i = 1:3
  fprintf('Error N=%d : %.6f\n', n_vals(i), errors(i));
end

error_rata = mean(errors);
error_persen = (error_rata / avg_exact) * 100;

fprintf('\nRata-rata Error : %.6f\n', error_rata);
fprintf('Error Persentase : %.6f%%\n\n', error_persen);
toc

figure;
plot(time_var, h_exact, 'g-', 'LineWidth', 1.5);
hold on;
plot(time_var, h_approx(:,1), 'b--');
plot(time_var, h_approx(:,2), 'r--');
plot(time_var, h_approx(:,3), 'y--');
xlabel('Waktu (t)');
ylabel('Tinggi (h)');
title('Perbandingan Nilai Exact dan Approximasi');
legend('Exact', 'N=23', 'N=24', 'N=25');
grid on;
hold off;
