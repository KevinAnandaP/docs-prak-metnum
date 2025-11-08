x = -5:0.5:5;
y = x;
[X,Y] = meshgrid(x,y);
Z = 10*sin(X./2) + 5*cos(Y./2);
contour3(X, Y, Z, 20);
xlabel('x');
ylabel('y');
zlabel('z');
title('Grafik Kontur 3D');
