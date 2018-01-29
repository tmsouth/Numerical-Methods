%Makes gifs, is very slow
%Needs work: Make the colours not change, speed up.
%Credit: Addiditions by Tobin, All the hard work by Lewis & Trent


close all
h = figure; 
axis tight manual   % this ensures that getframe() returns a consistent size
filename = 'Animated.gif'; 
framerate = 15;     % <<<< set your frame rate
delay_time = 1/framerate;


maxints = 100;      % << change the 
nMesh = 500;        % << resolution;
xc = -0.2485;       % << set your
yc = 0.6249;        % << zoom points;
number_of_frames=40;% << change the number of frames;

for w = 1:-0.01:1/number_of_frames 
    
    x = linspace(xc-w,xc+w,nMesh);
    y = linspace(yc-w,yc+w,nMesh);
    [X, Y] = meshgrid(x,y);
    
    z = X +1i*Y;
    
    for k = 1:maxints
        
        dz = -(z.^4 - 1)./(4*z.^3); %<<<< edit your function
        
        z = z + dz;
    end
    
    %% Assign Colours
    Z = zeros(size(z));
    
    for j = 1:4
        Z( abs(z-1i^j) < 0.01 ) = j;
    end
        
    %% Plotting/ Giffing
    
    colormap(jet)
    pcolor(x,y,Z)
    caxis('manual')
    shading flat
    axis([xc-w,xc+w,yc-w,yc+w])
    drawnow
    
    %% Giffing
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 

    % Write to the GIF File 
    if w == 1 %<< if you change the starting width, change this.
         imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',delay_time); 
    else 
         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',delay_time); 
    end 
    
        
end

close all
web(filename)
        
        
        
        