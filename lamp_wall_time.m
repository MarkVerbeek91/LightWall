

%% INIT variables

Nrows_panel1 = 6;
Ncols_panel1 = 150;

Nleds_panel1 = Nrows_panel1 * Ncols_panel1;

Nrows_panel2 = Nrows_panel1;

% all lamps are off
lamps_array1_colors = zeros(Nrows_panel1, Ncols_panel1,  3);

lamps_array1_posx = linspace(0, 1.8, Ncols_panel1);
lamps_array1_posy = linspace(0.2, 1, Nrows_panel1);

Z = 0.1 * peaks(Ncols_panel1);

% surf(Z)

surf(Z([1,30, 60, 90, 120, 149],:))

%%
lamps_array1_posx = repmat(lamps_array1_posx ,Nrows_panel1,1);
lamps_array1_posy = repmat(lamps_array1_posy',1,Ncols_panel1);



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
for fn = 0:duration
    %%
%     delete(gca)
    
    sun_size = sun.size_start + (sun.size_end - sun.size_start) / duration;
    sun_posx = sun.start_pos(1) * cos(fn / (15 * pi ));
    sun_posy = sun.start_pos(2) + sun.start_pos(2) * sin(fn / (15 * pi ));
    
    aura_size = aura.size_start + fn * (aura.size_end - aura.size_start) / duration;
    sky_size  =  sky.size_start + fn * ( sky.size_end -  sky.size_start) / duration;
    
    % calculate distance to centre sun
    pixels = ((lamps_array1_posx - sun_posx).^2 + ...
              (lamps_array1_posy - sun_posy).^2).^(0.5);

    sun_pixels = find(pixels < sun_size);

    aura_pixels = find(pixels < ( sun_size + aura_size));

    sky_pixels = find(pixels < ( sun_size + aura_size + sky_size));

    figure ('units', 'normalized', 'outerposition', [0 0 1 1]);
      hold on
    for ii = 1:length(sky_pixels)
        plot(lamps_array1_posx(sky_pixels(ii)), lamps_array1_posy(sky_pixels(ii)), '.', 'MarkerSize', 20, ...
          'Color', [ 0 0 (0.5 + 0.4 * rand(1))] )
    end 

    for ii = 1:length(aura_pixels)
        plot(lamps_array1_posx(aura_pixels(ii)), lamps_array1_posy(aura_pixels(ii)), '.', 'MarkerSize', 20, ...
          'Color', [ 1 (1 - 0.8 * rand(1))  0])
    end 

    for ii = 1:length(sun_pixels)
        plot(lamps_array1_posx(sun_pixels(ii)), lamps_array1_posy(sun_pixels(ii)), '.', 'MarkerSize', 20, ...
          'Color', [ (1 - 0.2 * rand(1)) (1 - 0.2 * rand(1)) (1 - 0.2 * rand(1))])
    end 


    set(gca, 'Color', [51,25,0]/255)
%     set(gca, 'units', 'normalized', 'outerposition', [0 0 1 1])
    
    xlim([ -0.1 1.9 ])
    ylim([ 0.1 1.1 ])

    
    frame = getframe();
    
    imwrite(frame.cdata, sprintf('frame%d.jpg', fn));

    
     %%
    close

%      pause(2)
        
        
        
        
end        
        
        
        
        
        
        

