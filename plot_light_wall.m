%% function to visualise to status of the LEDs_wall struct
%

function plot_light_wall(LEDs_wall, fn, axh)
  
    % init picture
    I = ones(1920, 1080, 3);

    % set background
    I(:,:,1) = 51/255;
    I(:,:,2) = 25/255;
    I(:,:,3) =  0/255;
    
    hold on
    for ii = 1:LEDs_wall.Nleds_panel1
        
        x_pixel =  floor(LEDs_wall.(sprintf('led_lamp%d', ii)).posx/LEDs_wall.xdim(2)*1840)+40;
        y_pixel =  floor(LEDs_wall.(sprintf('led_lamp%d', ii)).posy/LEDs_wall.xdim(2)*1000)+40;
      
%         plot(axh,  LEDs_wall.(sprintf('led_lamp%d', ii)).posx, ...
%                    LEDs_wall.(sprintf('led_lamp%d', ii)).posy, ...
%                    '.', 'MarkerSize', 20, ...
%                    'Color', LEDs_wall.(sprintf('led_lamp%d', ii)).RGB)
        I(x_pixel:x_pixel+10, y_pixel:y_pixel+10, 1 ) = LEDs_wall.(sprintf('led_lamp%d', ii)).RGB(1);
        I(x_pixel:x_pixel+10, y_pixel:y_pixel+10, 2 ) = LEDs_wall.(sprintf('led_lamp%d', ii)).RGB(2);
        I(x_pixel:x_pixel+10, y_pixel:y_pixel+10, 3 ) = LEDs_wall.(sprintf('led_lamp%d', ii)).RGB(3);

    end 


%     set(axh, 'Color', [51,25,0]/255)
%     set(gca, 'units', 'normalized', 'outerposition', [0 0 1 1])
    
%     xlim([ -0.1 1.9 ])
%     ylim([ 0.1 1.1 ])

    
%     frame = getframe();
    imshow(rot90(I))
    imwrite(rot90(I), sprintf('frame%d.jpg', fn));

%     cla(axh, 'reset')
end