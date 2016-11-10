



Nrows_panel1 = 6;
Ncols_panel1 = 150;

Nleds_panel1 = Nrows_panel1 * Ncols_panel1;

Nrows_panel2 = Nrows_panel1;
% Ncols_panel2 = 30;

% all lamps are off
lamps_array1_colors = zeros(Nrows_panel1, Ncols_panel1,  3);

% lamps_array2_colors = ones(Nrows_panel2, Ncols_panel2,  3);

lamps_array1_posx = linspace(0, 1.8, Ncols_panel1);
lamps_array1_posy = linspace(0.2, 1, Nrows_panel1);

lamps_array1_posx = repmat(lamps_array1_posx ,Nrows_panel1,1);
lamps_array1_posy = repmat(lamps_array1_posy',1,Ncols_panel1);
% LEDs = struct('posx',repmat(lamps_array1_posx,1,Nrows_panel1), ...
%               'posy',repmat(lamps_array1_posy,1,Ncols_panel1));

% LEDs(Nrows_panel1 * Ncols_panel1) = struct('lamp',LEDlamp);


%%

hold on
for ii = 1:Nleds_panel1
    plot(lamps_array1_posx(ii), lamps_array1_posy(ii), '.', 'MarkerSize', 10, ...
         'Color', [ lamps_array1_colors(ii), lamps_array1_colors(ii + Nleds_panel1), lamps_array1_colors(ii + 2*Nleds_panel1)])
end

xlim([ -0.1 1.9 ])
ylim([  0.1 1.1 ])

%% Zon
% start op 1.6, grote 0.25

duration = 60; % s
fps      =  1; % fps;

sun.size_start = 0.25;
sun.size_eind  = 0.5 ;
sun.size_aura  = 0.2 ; 
sky.size_start = 0.1 ;
sky.size_end   = 1.0 ;
sun.start_pos  = [ 1.6, 0.4 ];
sun.eind_pos   = [ 1.2, 1 ];

pixels = ((lamps_array1_posx -sun.start_pos(1)).^2 + ...
          (lamps_array1_posy -sun.start_pos(2)).^2).^(0.5);
   
sun_pixels = find(pixels < sun.size_start);

aura_pixels = find(pixels < ( sun.size_start + sun.size_aura));

sky_pixels = find(pixels < ( sun.size_start + sun.size_aura + sky.size_start));

hold on
for ii = 1:length(sky_pixels)
    plot(lamps_array1_posx(sky_pixels(ii)), lamps_array1_posy(sky_pixels(ii)), '.', ...
        'Color', [ lamps_array1_colors(ii), lamps_array1_colors(ii + Nleds_panel1), lamps_array1_colors(ii + 2*Nleds_panel1)] )
end 

for ii = 1:length(aura_pixels)
    plot(lamps_array1_posx(aura_pixels(ii)), lamps_array1_posy(aura_pixels(ii)), '.', 'Color', 'y')
end 

for ii = 1:length(sun_pixels)
    plot(lamps_array1_posx(sun_pixels(ii)), lamps_array1_posy(sun_pixels(ii)), '.', 'Color', [1 1 1])
end 

set(gca, 'Color', [165,42,42]/255)

xlim([ 0 1.8 ])
ylim([ 0.1 1 ])

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

