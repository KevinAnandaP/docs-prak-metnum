clear; clc; close all;

t_data = [0, 5, 10, 15, 20];
v_data = [0, 130, 227, 562, 517];

fprintf('--- 1. Interpolasi Newton Divided Difference ---\n');

x_sub = t_data(3:5);
y_sub = v_data(3:5);

[b_sub] = newton_dd_coeffs(x_sub, y_sub);
val_13_5 = eval_newton(13.5, x_sub, b_sub);

fprintf('Perkiraan Kecepatan pada t = 13.5 s (menggunakan 3 titik): %.4f m/s\n', val_13_5);

[b_full] = newton_dd_coeffs(t_data, v_data);

V4_func = @(t) eval_newton(t, t_data, b_full);

t_plot = linspace(0, 20, 100);
v_plot = zeros(size(t_plot));
for k = 1:length(t_plot)
    v_plot(k) = V4_func(t_plot(k));
end

figure(2);
plot(t_plot, v_plot, 'b-', 'LineWidth', 1.5); hold on;
plot(t_data, v_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
plot(13.5, val_13_5, 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

xlabel('Waktu (s)');
ylabel('Kecepatan (m/s)');
title('Interpolasi Kecepatan Roket (Newton Divided-Difference)');
legend('Interpolasi V4(t)', 'Data Pengamatan', 'V(13.5) [3 titik]', 'Location', 'NorthWest');
grid on;

fprintf('\n--- 2. Integrasi Numerik (Simpson 3/8) ---\n');


a = 0;
b = 20;
N_simpson = 30;
h_simpson = (b - a) / N_simpson;

sum_result = 0;

y_vals = zeros(1, N_simpson+1);
for i = 0:N_simpson
    t_val = a + i * h_simpson;
    y_vals(i+1) = V4_func(t_val);
end

sum_res = y_vals(1) + y_vals(end);

for i = 1:(N_simpson-1)
    if mod(i, 3) == 0
        factor = 2;
    else
        factor = 3;
    end
    sum_res = sum_res + factor * y_vals(i+1);
end

total_ketinggian = (3 * h_simpson / 8) * sum_res;

fprintf('Total Ketinggian yang ditempuh roket (0 <= t <= 20): %.4f meter\n', total_ketinggian);
