%% Table 5

% Dosyaya belirlediğimiz seçeneklerle erişim sağlıyoruz.
table_5 = readtable('Tables.xlsx', 'Sheet', 'Table_5');
numaralar5 = table_5.EarthquakeRecordNo;
dy_withoutTMD = table_5.DisplacementInYDirectionWithoutTMD_m_;
dy_withTMD = table_5.DisplacementInYDirectionWithTMD_m_;

figure
plot(numaralar5, dy_withoutTMD, 'LineWidth', 1.2);
set(gca, 'XTick', 1:1:max(numaralar5));

hold on
plot(numaralar5, dy_withTMD, 'LineWidth', 1.2);
grid on

legend('Without TMD', 'With TMD', 'Location', 'northeast');

xlim([1 22]);

title(sprintf('%s\n%s\n%s\n%s', 'The maximum displacement in the y-direction', 'under 22 earthquake records for the single-story structure'));
ylabel('Displacement in the y direction (m)');
xlabel('22 Earthquake records');
hold off
% Grafiği PNG olarak kaydet
saveas(gcf, 'grafik_table_5.png');

