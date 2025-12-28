format long

fungsi_r = @(r) (4/3) * pi * r.^3 - 300;

left = 0.0;
right = 10.0;
toleransi = 0.0001;
max_iter = 20;

f_left = fungsi_r(left);
f_right = fungsi_r(right);

if f_left * f_right > 0
  error('Batas tidak valid');
end

fprintf('\n=== METODE BISEKSI ===\n');
fprintf('Iterasi\tBatas Kiri\tBatas Kanan\tTitik Tengah\tf(tengah)\n');

for iter = 1:max_iter
  tengah = (left + right) / 2;
  f_tengah = fungsi_r(tengah);
  
  fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n', iter, left, right, tengah, f_tengah);
  
  if abs(f_tengah) <= toleransi
    break;
  end
  
  if f_left * f_tengah < 0
    right = tengah;
    f_right = f_tengah;
  else
    left = tengah;
    f_left = f_tengah;
  end
end

jari_jari = tengah;

fprintf('\n=== HASIL ===\n');
fprintf('Jari-jari bola (r) = %.6f cm\n', jari_jari);

tinggi_tabung = 2 * jari_jari;
vol_tabung = pi * jari_jari^2 * tinggi_tabung;
vol_bola = 300;
vol_sisanya = vol_tabung - vol_bola;

fprintf('Tinggi tabung (t) = %.6f cm\n', tinggi_tabung);
fprintf('Volume tabung = %.4f cm^3\n', vol_tabung);
fprintf('Volume di luar bola = %.4f cm^3\n\n', vol_sisanya);

r_plot = linspace(-2, 8, 500);
y_plot = fungsi_r(r_plot);

figure;
plot(r_plot, y_plot, 'b-', 'LineWidth', 2);
hold on;
plot([-2 8], [0 0], 'k--', 'LineWidth', 1);
plot([0 0], [-600 1200], 'k--', 'LineWidth', 1);
plot(jari_jari, fungsi_r(jari_jari), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

xlabel('r (cm)');
ylabel('f(r)');
title('Fungsi Volume Bola: f(r) = (4/3)pi*r^3 - 300');
grid on;
legend('f(r)', 'Sumbu X', 'Sumbu Y', sprintf('r = %.4f', jari_jari), 'Location', 'northwest');
hold off;

input('Tekan Enter untuk keluar...');
