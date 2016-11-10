

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

sun.size_start = 0.25;
sun.size_end  = 0.5 ;
aura.size_start  = 0.15 ; 
aura.size_end   = 0.3 ; 
sky.size_start = 0.1 ;
sky.size_end   = 3.0 ;
sun.start_pos  = [ 1.6, 0.4 ];
sun.eind_pos   = [ 1.2, 1 ];

%%
figure ('units', 'normalized', 'outerposition', [0 0 1 1]);
axh = gca;
%%
for fn = 0:60
    %%
%     delete(gca)
    fprintf('Frame number: %d\n', fn)

    sun_size = sun.size_start + (sun.size_end - sun.size_start) / duration;
    sun_posx = sun.start_pos(1) * cos(fn / (15 * pi ));
    sun_posy = sun.start_pos(2) + sun.start_pos(2) * sin(fn / (15 * pi ));

    aura_size =  sun_size + aura.size_start + fn * (aura.size_end - aura.size_start) / duration;
    sky_size  = aura_size +  sky.size_start + fn * ( sky.size_end -  sky.size_start) / duration;

    for ii = 1:Nleds_panel1
        pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx - sun_posx)^2 + ...
                          (LEDs_wall.(sprintf('led_lamp%d', ii)).posy - sun_posy)^2 );
                        
        if pixel_var < sun_size
          % pixel is sun
          LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = ...
            [ (1 - 0.2 * rand(1)) (1 - 0.2 * rand(1)) (1 - 0.2 * rand(1))];
          
        elseif pixel_var < aura_size 
          % pixel is aura
          LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = ...
            [ 1 (1 - 0.8 * rand(1))  0];
          
        elseif pixel_var < sky_size
          % pixel is sky
          if pixel_var < aura_size * 1.5 && rand(1) < 0.1 
            LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = ...
              [ 1 (1 - 0.8 * rand(1))  0];
          else
            LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = ...
              [ 0 0 (0.5 + 0.4 * rand(1))];
          end
        end
      
        %%
        % apply effect
        x = LEDs_wall.(sprintf('led_lamp%d', ii)).posx - sun_posx;
        y = LEDs_wall.(sprintf('led_lamp%d', ii)).posy - sun_posy;
        effect_amp =  0.1 * sin(fn/5) * ( sin(20 * x ) + cos(20 * y + 5 * x)  );
%         effect_amp = max(effect_amp / 8.2, -1.0);
        
        LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = min( 1.0, ...
            max( 0.0, ...
                LEDs_wall.(sprintf('led_lamp%d', ii)).RGB + effect_amp));
                   
    end

    %%
    
    hold on
    for ii = 1:Nleds_panel1
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
     %%
%     close

%      pause(2)
        
        
        
        
end        
        
        
        
        
        
        

