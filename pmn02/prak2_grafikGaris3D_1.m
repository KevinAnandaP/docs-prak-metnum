t = 0:0.2:10*pi;
x = 2*sin(t);
y = 2*cos(t);
z = 0.1*t.^2;
plot3(x,y,z,'r', 'linewidth', 2);
grid on
xlabel('x');
ylabel('y');
zlabel('z');
title('Grafik Garis 3D: Spiral Parabola');
