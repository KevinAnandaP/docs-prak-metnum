f = @(x,y) (4*x^3 - 2*x + 1) / (2 + y);

x0 = 0;
y0 = 1;
xf = 2;
n = 15;
h = (xf - x0) / n;

% 1. METODE ANALITIK (EKSAK)
syms x_s y_s(x_s);
ode = diff(y_s, x_s) == (4*x_s^3 - 2*x_s + 1)/(2 + y_s);
cond = y_s(0) == 1;
sol_eksak = dsolve(ode, cond);
y_eksak = double(subs(sol_eksak(1), x_s, xf));

% 2. METODE EULER
x_eu = x0; y_eu = y0;
for i = 1:n
    y_eu = y_eu + f(x_eu, y_eu) * h;
    x_eu = x_eu + h;
end

% 3. METODE HEUN
x_he = x0; y_he = y0;
for i = 1:n
    k1 = f(x_he, y_he);
    k2 = f(x_he + h, y_he + k1 * h);
    y_he = y_he + (h/2) * (k1 + k2);
    x_he = x_he + h;
end

% 4. METODE RUNGE KUTTA ORDE 4
x_rk = x0; y_rk = y0;
for i = 1:n
    k1 = f(x_rk, y_rk);
    k2 = f(x_rk + h/2, y_rk + k1 * h/2);
    k3 = f(x_rk + h/2, y_rk + k2 * h/2);
    k4 = f(x_rk + h, y_rk + k3 * h);
    y_rk = y_rk + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    x_rk = x_rk + h;
end

% PERHITUNGAN GALAT
g_abs_eu = abs(y_eksak - y_eu);
g_rel_eu = abs(g_abs_eu / y_eksak) * 100;

g_abs_he = abs(y_eksak - y_he);
g_rel_he = abs(g_abs_he / y_eksak) * 100;

g_abs_rk = abs(y_eksak - y_rk);
g_rel_rk = abs(g_abs_rk / y_eksak) * 100;

fprintf('Hasil y(2):\n');
fprintf('Eksak : %.6f\n', y_eksak);
fprintf('Euler : %.6f\n', y_eu);
fprintf('Heun  : %.6f\n', y_he);
fprintf('RK4   : %.6f\n\n', y_rk);

fprintf('Galat Abstrak:\n');
fprintf('Euler : %.6f\n', g_abs_eu);
fprintf('Heun  : %.6f\n', g_abs_he);
fprintf('RK4   : %.6f\n\n', g_abs_rk);
