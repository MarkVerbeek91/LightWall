%% function to visualise to status of the LEDs_wall struct
%

function plot_light_wall(LEDs_wall, fn, axh)
  
    hold on
    for ii = 1:LEDs_wall.Nleds_panel1
        plot(axh,  LEDs_wall.(sprintf('led_lamp%d', ii)).posx, ...
                   LEDs_wall.(sprintf('led_lamp%d', ii)).posy, ...
                   '.', 'MarkerSize', 20, ...
                   'Color', LEDs_wall.(sprintf('led_lamp%d', ii)).RGB)
    end 


    set(axh, 'Color', [51,25,0]/255)
%     set(gca, 'units', 'normalized', 'outerposition', [0 0 1 1])
    
    xlim([ -0.1 1.9 ])
    ylim([ 0.1 1.1 ])

    
    frame = getframe();
    
    imwrite(frame.cdata, sprintf('frame%d.jpg', fn));

    cla(axh, 'reset')
end