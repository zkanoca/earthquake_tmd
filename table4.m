%% Table 4

% Dosyaya belirlediğimiz seçeneklerle erişim sağlıyoruz.
table_4 = readtable('Tables.xlsx', 'Sheet', 'Table_4');
numaralar4 = table_4.EarthquakeRecordNo;
dx_withoutTMD = table_4.DisplacementInX_directionWithoutTMD_m_;
dx_withTMD = table_4.DisplacementInX_directionWithTMD_m_;

figure
plot(numaralar4, dx_withoutTMD, 'LineWidth', 1.2);
set(gca, 'XTick', 1:1:max(numaralar4));

hold on
plot(numaralar4, dx_withTMD, 'LineWidth', 1.2);
grid on

legend('Without TMD', 'With TMD', 'Location', 'northeast');

xlim([1 22]);

title(sprintf('%s\n%s\n%s\n%s', 'The plot of maximum displacement', 'in the x-direction', 'under 22 earthquake records', 'for the single-story structure'));
ylabel('Displacement in the x direction (m)');
xlabel('22 Earthquake records');
hold off
% Grafiği PNG olarak kaydet
saveas(gcf, 'grafik_table_4.png');
