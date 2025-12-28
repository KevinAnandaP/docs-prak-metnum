tic
matrix_A = [2.5 1.5 5 0.5; 4 0.75 1 2; 2 1.5 0.5 6; 1 4.25 2 0.9];
vector_b = [161000; 149000; 251500; 173000];

M = [matrix_A vector_b];
num_rows = size(M, 1);

for row = 1:num_rows-1
  [~, max_idx] = max(abs(M(row:num_rows, row)));
  max_idx = max_idx + row - 1;
  
  if max_idx ~= row
    temp_row = M(row, :);
    M(row, :) = M(max_idx, :);
    M(max_idx, :) = temp_row;
  end
  
  for j = row+1:num_rows
    factor = M(j, row) / M(row, row);
    M(j, :) = M(j, :) - factor * M(row, :);
  end
end

fprintf('\nMatriks setelah forward elimination:\n');
disp(M(:,1:num_rows));

for row = num_rows:-1:2
  for j = row-1:-1:1
    factor = M(j, row) / M(row, row);
    M(j, :) = M(j, :) - factor * M(row, :);
  end
end

fprintf('\nMatriks setelah backward elimination:\n');
disp(M(:,1:num_rows));

result = zeros(num_rows, 1);
for i = 1:num_rows
  result(i) = M(i, end) / M(i, i);
end

fprintf('\n=== HARGA PER KILOGRAM ===\n');
fprintf('Beras  : Rp %.2f\n', result(1));
fprintf('Telur  : Rp %.2f\n', result(2));
fprintf('Tepung : Rp %.2f\n', result(3));
fprintf('Ayam   : Rp %.2f\n\n', result(4));
toc
