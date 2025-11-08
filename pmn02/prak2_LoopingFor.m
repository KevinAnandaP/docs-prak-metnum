p = 0;
for i = 5:-1:1
    p = p + i^3;
end
disp('Nilai akhir p:')
disp(p)

q_list = [];
for j = 1:1.5:7
    q = j/4;
    q_list = [q_list, q];
end
disp('Vektor q akhir:')
disp(q_list)
