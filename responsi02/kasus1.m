clear; clc; close all;

V = 25 * 10^6;
Q = 1.5 * 10^6;
C_initial = 10^7;
C_aman = 5 * 10^6;

f = @(t, c) -(Q/V) * c;

t_start = 0;
t_end = 20;
N = 20;
h = (t_end - t_start) / N;

t = zeros(1, N+1);
C = zeros(1, N+1);

t(1) = t_start;
C(1) = C_initial;

fprintf('--- Simulasi Kadar Polutan Danau ---\n');
fprintf('Minggu ke-0: %.2f bagian/m^3\n', C(1));

found_safe = false;
waktu_aman = 0;

for i = 1:N
    ti = t(i);
    ci = C(i);

    k1 = f(ti, ci);
    k2 = f(ti + 0.5*h, ci + 0.5*k1*h);
    k3 = f(ti + 0.5*h, ci + 0.5*k2*h);
    k4 = f(ti + h, ci + k3*h);

    C(i+1) = ci + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    t(i+1) = t(i) + h;

    if C(i+1) < C_aman && ~found_safe
        waktu_aman = t(i+1);
        found_safe = true;

        fprintf('-> PADA MINGGU KE-%d, Konsentrasi: %.2f (SUDAH AMAN)\n', t(i+1), C(i+1));

        t = t(1:i+1);
        C = C(1:i+1);
        break;
    else
        fprintf('Minggu ke-%d: %.2f bagian/m^3\n', t(i+1), C(i+1));
    end
end

if found_safe
    fprintf('\nKESIMPULAN:\n');
    fprintf('Air danau dinilai aman pada minggu ke-%d.\n', waktu_aman);
else
    fprintf('\nDalam 20 minggu, air belum mencapai batas aman.\n');
end

figure(1);
plot(t, C, '-ro', 'LineWidth', 2, 'MarkerFaceColor', 'r');
hold on;
line([t(1), t(end)], [C_aman, C_aman], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2);
text(t(1), C_aman, '  Batas Aman', 'VerticalAlignment', 'bottom', 'Color', 'g', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Waktu (Minggu)');
ylabel('Konsentrasi Polutan (C)');
title('Penurunan Konsentrasi Polutan Danau (RK4)');
grid on;
hold off;
