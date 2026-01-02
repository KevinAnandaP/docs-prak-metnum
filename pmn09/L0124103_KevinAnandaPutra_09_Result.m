fa = @(x) x .* exp(2*x);
aa = -2; ba = 2;

fb = @(x) x.^2 + sin(2*x);
ab = 0; bb = 10;

nn = [2, 3, 6];

fprintf('--- HASIL FUNGSI A ---\n');
eksak_a = integral(fa, aa, ba);
fprintf('Nilai Eksak: %.6f\n', eksak_a);

for n = nn
    fprintf('\nIterasi n = %d:\n', n);
    h = (ba - aa) / n;
    x = aa:h:ba;
    y = fa(x);

    res_trap = (h/2) * (y(1) + 2*sum(y(2:n)) + y(n+1));
    fprintf('Trapezoidal: %.6f\n', res_trap);

    if mod(n, 2) == 0
        res_s13 = (h/3) * (y(1) + 4*sum(y(2:2:n)) + 2*sum(y(3:2:n-1)) + y(n+1));
        fprintf('Simpson 1/3: %.6f\n', res_s13);
    else
        fprintf('Simpson 1/3: n harus genap\n');
    end

    if mod(n, 3) == 0
        s38 = y(1) + y(n+1);
        for i = 2:n
            if mod(i-1, 3) == 0
                s38 = s38 + 2*y(i);
            else
                s38 = s38 + 3*y(i);
            end
        end
        res_s38 = (3*h/8) * s38;
        fprintf('Simpson 3/8: %.6f\n', res_s38);
    else
        fprintf('Simpson 3/8: n harus kelipatan 3\n');
    end
end

fprintf('\n--- HASIL FUNGSI B ---\n');
eksak_b = integral(fb, ab, bb);
fprintf('Nilai Eksak: %.6f\n', eksak_b);

for n = nn
    fprintf('\nIterasi n = %d:\n', n);
    h = (bb - ab) / n;
    x = ab:h:bb;
    y = fb(x);

    res_trap = (h/2) * (y(1) + 2*sum(y(2:n)) + y(n+1));
    fprintf('Trapezoidal: %.6f\n', res_trap);

    if mod(n, 2) == 0
        res_s13 = (h/3) * (y(1) + 4*sum(y(2:2:n)) + 2*sum(y(3:2:n-1)) + y(n+1));
        fprintf('Simpson 1/3: %.6f\n', res_s13);
    else
        fprintf('Simpson 1/3: n harus genap\n');
    end

    if mod(n, 3) == 0
        s38 = y(1) + y(n+1);
        for i = 2:n
            if mod(i-1, 3) == 0
                s38 = s38 + 2*y(i);
            else
                s38 = s38 + 3*y(i);
            end
        end
        res_s38 = (3*h/8) * s38;
        fprintf('Simpson 3/8: %.6f\n', res_s38);
    else
        fprintf('Simpson 3/8: n harus kelipatan 3\n');
    end
end
