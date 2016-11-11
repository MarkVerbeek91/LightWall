%%
%

function LEDs_wall = Effect_circleWave(LEDs_wall, fn)


x_offset = 1;
y_offset = 0.5;

for ii = 1:LEDs_wall.Nleds_panel1
    pixel_var = sqrt( (LEDs_wall.(sprintf('led_lamp%d', ii)).posx - x_offset)^2 + ...
                      (LEDs_wall.(sprintf('led_lamp%d', ii)).posy - y_offset)^2 );
%     r = sqrt( (repmat(x - x_offset, N, 1)).^2 + (repmat(y - y_offset, N, 1)').^2); 

    z = 0.5 * sin(pixel_var * 4 * pi - fn / (2 * pi)) + 0.5;


    LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = [ 1 1 1 ] * z;


end