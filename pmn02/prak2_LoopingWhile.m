p = 10;
while (p >= 0)
    if (mod(p, 3) == 0)
        p = p - 1;
        continue;
    end
    if (p == 5)
        break;
    end
    disp(p);
    p = p - 1;
end
disp('Loop Selesai')
