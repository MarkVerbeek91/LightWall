%%
%

function LEDs_wall = Effect_circleWave_colour2(LEDs_wall, fn)


x_offset1 = 1;
y_offset1 = 0.5;

x_offset2 = 0.5;
y_offset2 = 1;

x_offset3 = 1.5;
y_offset3 = 0.7;



for ii = 1:LEDs_wall.Nleds_panel1
    pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx - x_offset1)^2 + ...
                      (LEDs_wall.(sprintf('led_lamp%d', ii)).posy - y_offset1)^2 );

    r = 0.5 * sin(pixel_var * 4 * pi - fn / (2 * pi)) + 0.5;
    
    pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx - x_offset2)^2 + ...
                      (LEDs_wall.(sprintf('led_lamp%d', ii)).posy - y_offset2)^2 );
    g = 0.5 * sin(pixel_var * 4 * pi - fn / (3 * pi)) + 0.5;
    
    pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx - x_offset3)^2 + ...
                      (LEDs_wall.(sprintf('led_lamp%d', ii)).posy - y_offset3)^2 );
    b = 0.5 * sin(pixel_var * 4 * pi - fn / (4 * pi)) + 0.5;

    LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = [ r g b ] ;


end