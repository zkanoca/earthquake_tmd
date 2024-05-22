clc, clear, close all;


deprem_no = 13; %input('Deprem numarası [1-22]: ');

% 44 sütunluk veride ilk sütun x datasını ikinci sütun y datasını tutuyor. 
x_index = deprem_no * 2 - 1;
y_index = deprem_no * 2;

kayit_table = readtable('Earthquakes.xls');

% tabloyu matrise dönüştür
kayit = kayit_table{:,:};

%ilgili deprem için zaman aralık değerini belirle
zaman_x = kayit(1, x_index);
zaman_y = kayit(1, y_index);

% ilgili deprem için genlikleri kaydet
genlikler_x = kayit(2:end, x_index);
genlikler_y = kayit(2:end, y_index);

% hem birinci sütunda hem de ikinci sütunda,
% sondan başlayarak 0 olmayan son elemanı buluyoruz.
% Bu şekilde gereksiz satırları grafikte göstermeyeceğiz.
son_satir_x = find(genlikler_x(:,1), 1, 'last');
son_satir_y = find(genlikler_y(:,1), 1, 'last');

zaman_serisi_x = zeros(size(genlikler_x));
zaman_serisi_y = zeros(size(genlikler_y));

for satir = 1:son_satir_x        
    zaman_serisi_x(satir, 1) = satir * zaman_x; 
    zaman_serisi_y(satir, 1) = satir * zaman_y; 
end   
 

%% Yer değiştirme grafiği
figure
plot(zaman_serisi_x, genlikler_x, 'b-');
grid on

xlabel('t (s)');
ylabel('deplasman (m)');
title('Zamana göre x ekseninde yer değiştirme');

figure
plot(zaman_serisi_y, genlikler_y, 'r-');
grid on

xlabel('t (s)');
ylabel('deplasman (m)');
title('Zamana göre y ekseninde yer değiştirme');