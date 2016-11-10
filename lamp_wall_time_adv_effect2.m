

%% INIT variables

Nrows_panel1 = 6;
Ncols_panel1 = 150;

Nleds_panel1 = Nrows_panel1 * Ncols_panel1;

% all lamps are off
lamps_array1_colors = zeros(Nrows_panel1, Ncols_panel1,  3);

lamps_array1_posx = linspace(0, 1.8, Ncols_panel1);
lamps_array1_posy = linspace(0.2, 1, Nrows_panel1);

% Z = 0.1 * peaks(Ncols_panel1);

% surf(Z)

% surf(Z([1,30, 60, 90, 120, 149],:))

%%
% lamps_array1_posx = repmat(lamps_array1_posx ,Nrows_panel1,1);
% lamps_array1_posy = repmat(lamps_array1_posy',1,Ncols_panel1);

for ii = 1:Ncols_panel1
  for jj = 1:Nrows_panel1
%     display(
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).posx = lamps_array1_posx(ii);
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).posy = lamps_array1_posy(jj);
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).RGB  = [ 0.0 0.0 0.0 ];
  end
end


%% Set animation parameters
% 

duration = 60; % s
fps      =  1; % fps;


%%
figure ('units', 'normalized', 'outerposition', [0 0 1 1]);
axh = gca;

for fn = 0:60
    %%
    fprintf('Frame number: %d\n', fn)
    

    for ii = 1:Nleds_panel1
        pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx)^2 + ...
                          (LEDs_wall.(sprintf('led_lamp%d', ii)).posy)^2 );
                        
        amp = sin(fn/ (2*pi));
        amp2 = sin(20 * pixel_var);
        
        
        
      
        %%
        % apply effect
%         x = LEDs_wall.(sprintf('led_lamp%d', ii)).posx - sun_posx;
%         y = LEDs_wall.(sprintf('led_lamp%d', ii)).posy - sun_posy;
        effect_amp =  abs(amp * amp2);
%         effect_amp = max(effect_amp / 8.2, -1.0);
        
        LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = min( 1.0, ...
            max( 0.0, ...
                LEDs_wall.(sprintf('led_lamp%d', ii)).RGB + effect_amp));
                   
    end

    %%
%     fh = figure ('units', 'normalized', 'outerposition', [0 0 1 1]);
    hold on
    for ii = 1:Nleds_panel1
        plot(axh, LEDs_wall.(sprintf('led_lamp%d', ii)).posx, ...
                  LEDs_wall.(sprintf('led_lamp%d', ii)).posy, ...
                  '.', 'MarkerSize', 20, ...
                  'Color', LEDs_wall.(sprintf('led_lamp%d', ii)).RGB)
    end 


    set(gca, 'Color', [51,25,0]/255)
%     set(gca, 'units', 'normalized', 'outerposition', [0 0 1 1])
    
    xlim([ -0.1 1.9 ])
    ylim([ 0.1 1.1 ])

    
    frame = getframe();
    
    imwrite(frame.cdata, sprintf('frame%d.jpg', fn));

    cla(axh, 'reset')
     %%
     %%
     
%      close

%      pause(2)
        
        
        
        
end        
        
        
        
        
        
        

