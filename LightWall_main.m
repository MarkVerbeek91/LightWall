%% LightWall
% a programm to simulate the LED light wall I planning to make

%% INIT variables
% physical parameters of the wall

Nrows_panel1 =   6; % number of rows
Ncols_panel1 = 150; % number of colums

% Nleds_panel1 = Nrows_panel1 * Ncols_panel1; % number of led

% physical dimentions of the wall
lamps_array1_posx = linspace(0, 1.8, Ncols_panel1);
lamps_array1_posy = linspace(0.2, 1, Nrows_panel1);


%% INIT LEDs
% calculate for each led there position on board and set Color on black (=
% off)

for ii = 1:Ncols_panel1
  for jj = 1:Nrows_panel1
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).posx = lamps_array1_posx(ii);
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).posy = lamps_array1_posy(jj);
    LEDs_wall.(sprintf('led_lamp%d', (jj-1)*Ncols_panel1 + ii)).RGB  = [ 0.0 0.0 0.0 ];
  end
end

LEDs_wall.Nleds_panel1 = Nrows_panel1 * Ncols_panel1;

%% Set animation parameters
% 

LEDs_wall.duration = 60; % s
fps      =  1; % fps;


%%
figure ('units', 'normalized', 'outerposition', [0 0 1 1]);
axh = gca;

effect = 'wave_colour';

%%
for fn = 61:120
    %%
    fprintf('Frame number: %d\n', fn)

    tic
    switch effect
      case 'sunset'
        LEDs_wall = Effect_sunrise(LEDs_wall, fn);
      case 'wave_circle'
        LEDs_wall = Effect_circleWave(LEDs_wall, fn);
      case 'wave_colour'
        LEDs_wall = Effect_circleWave_colour(LEDs_wall, fn);
      otherwise
        error('no such effect number')
    end
    toc            
    

    %% Plot 
    tic
    plot_light_wall(LEDs_wall, fn, axh);
    toc  
        
end        
        
        
        
        
        
        

