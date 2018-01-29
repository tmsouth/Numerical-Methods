

maxints = 100;
nMesh = 400;

x = linspace(-1,1,nMesh);
y = linspace(-1,1,nMesh);
[X, Y] = meshgrid(x,y);

z = X +1i*Y;

for k = 1:maxints

dz = -(z.^4 - 1)./(4*z.^3); %<<<< edit function

z = z + dz;
end


%% Assign Colours
Z = zeros(size(z));

for j = 1:4
Z( abs(z-1i^j) < 0.0000001 ) = j;
end

%% Plotting/ Giffing

colormap(jet)
pcolor(x,y,Z)
shading flat
axis([-1,1,-1,1])
drawnow