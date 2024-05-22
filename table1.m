%% Table 1

% Dosyaya belirlediğimiz seçeneklerle erişim sağlıyoruz.
table_1 = readtable('Tables.xlsx', 'Sheet', 'Table_1');
numaralar1 = table_1.No;
dy_withoutTMD = table_1.Earthquake;
dy_withTMD = table_1.Year;
buyuklukler = table_1.Magnitude;

figure
grafik1 = bar(numaralar1, buyuklukler);
% seRt(gca, 'XTickLabel',numaralar);
set(gca, 'XTick', 1:1:max(numaralar1));
% xtickangle(90); % X eksenindeki değerlerin döndürme açısı

grafik1.FaceColor = 'flat';
hold on
grid on

% Her noktaya yıl ve yer bilgilerini etiket olarak ekleyelim.
for i = 1:length(dy_withTMD)
    
    %Her bir sütun için etiket metnini ayarlıyoruz.
    etiket = sprintf(' %s, %s', string(dy_withoutTMD(i)), string(dy_withTMD(i)) );
    
    % Her sütun için rastgele renk belirliyoruz.
    % Rengin çok açık olmaması için 1.2'ye bölüyoruz.
    renk = [rand/1.2 rand/1.2 rand/1.2];
    
    
    text(numaralar1(i), buyuklukler(i), etiket, 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Rotation',90, 'Color', renk, 'FontSize', 12);
    
    
    grafik1.CData(i,:) = renk;
    
end


xlim([0 23]);
ylim([6 9]);
title('Major Earthquakes');

hold off
% Grafiği PNG olarak kaydet
saveas(gcf, 'grafik_table_1.png');