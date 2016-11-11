%%
%

function LEDs_wall = Effect_random(LEDs_wall)


for ii = 1:LEDs_wall.Nleds_panel1
    

    LEDs_wall.(sprintf('led_lamp%d', ii)).RGB = [ rand(1) rand(1) rand(1) ] ;


end