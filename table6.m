%% Table 6

% Dosyaya belirlediğimiz seçeneklerle erişim sağlıyoruz.
table_6 = readtable('Tables.xlsx', 'Sheet', 'Table_6');
numaralar6 = table_6.EarthquakeRecordNo;
d_theta_withoutTMD = table_6.DisplacementIn_DirectionWithoutTMD_rad_;
d_theta_withTMD = table_6.DisplacementIn_DirectionWithTMD_rad_;

figure
plot(numaralar6, d_theta_withoutTMD, 'LineWidth', 1.2);
set(gca, 'XTick', 1:1:max(numaralar6));

hold on
plot(numaralar6, d_theta_withTMD, 'LineWidth', 1.2);
grid on

legend('Without TMD', 'With TMD', 'Location', 'northeast');

xlim([1 22]);

title(sprintf('%s\n%s\n%s\n%s', 'The maximum displacement', 'in the θ-direction', 'under 22 earthquake records', 'for the single-story structure'));
ylabel('Displacement in the θ direction (rad)');
xlabel('22 Earthquake records');
hold off
% Grafiği PNG olarak kaydet
saveas(gcf, 'grafik_table_6.png');

