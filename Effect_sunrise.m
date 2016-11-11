%% Sun rise effect

function LEDs_wall = Effect_sunrise(LEDs_wall, fn)

    sun.size_start = 0.25;
    sun.size_end  = 0.5 ;
    aura.size_start  = 0.15 ; 
    aura.size_end   = 0.3 ; 
    sky.size_start = 0.1 ;
    sky.size_end   = 3.0 ;
    sun.start_pos  = [ 1.6, 0.4 ];
    sun.eind_pos   = [ 1.2, 1 ];

    sun_size = sun.size_start + (sun.size_end - sun.size_start) / LEDs_wall.duration;
    sun_posx = sun.start_pos(1) * cos(fn / (15 * pi ));
    sun_posy = sun.start_pos(2) + sun.start_pos(2) * sin(fn / (15 * pi ));

    aura_size =  sun_size + aura.size_start + fn * (aura.size_end - aura.size_start) / LEDs_wall.duration;
    sky_size  = aura_size +  sky.size_start + fn * ( sky.size_end -  sky.size_start) / LEDs_wall.duration;

    for ii = 1:LEDs_wall.Nleds_panel1
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
end