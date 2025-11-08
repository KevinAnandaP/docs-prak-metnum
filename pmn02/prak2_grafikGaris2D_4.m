x = 0:0.01:6;
y1 = 10*sin(4*x);
y2 = 5*cos(2*x);
plot(x, y1, x, y2);
title('Grafik Dua Fungsi Trigonometri');
legend('10*sin(4*x)', '5*cos(2*x)');
