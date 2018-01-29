%plotweather.m
% Tobin South, a1704567
% Using BOM Data and plots a contour map of rainfall

locations=importdata('sa_coast_lonlat.dat');

Data = importdata('BOM_20170823130000.dat');

yj = Data(:,1);
xj = Data(:,2);
rainfall = Data(:,7);
fj = rainfall;

xlim = [136 141];
ylim = [-37 -33];

x = linspace(xlim(1), xlim(2),100);
y = linspace(ylim(1),ylim(2) ,100);

[X, Y] = meshgrid(x,y);

result = polyharm(X,Y,xj,yj,fj);

contour(X,Y,result)
hold on
plot(locations(:,1),locations(:,2),'r--')
scatter(xj,yj,'black*')
hold off
axis([xlim ylim])
c = colorbar;
c.Label.String = 'Rainfall (mm)';
title('Contour plot of rainfall at 1pm 23/08/17')
xlabel('longitude')
ylabel('latitude')


