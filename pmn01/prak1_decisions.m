x = 15;

if (x > 10)
    disp('Angka yang dimasukkan lebih besar dari 10.');
else
    disp('Angka yang dimasukkan TIDAK lebih besar dari 10.');
end

pilihan = 2;

switch(pilihan)
    case 1
        disp('Anda memilih nomor 1.');
    case 2
        disp('Anda memilih nomor 2.');
    otherwise
        disp('Pilihan tidak ada.');
end
