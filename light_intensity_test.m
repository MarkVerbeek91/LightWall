%% light intensity function 
% 

N = 100; % number of pixels

light = linspace(0, 1, N);

light_mat_r = repmat(light, N, 1, 1);
light_mat_g = repmat(light, N, 1, 1)';
light_mat_b = fliplr(repmat(light, N, 1, 1));

light_mat(:,:,1) = light_mat_r;
light_mat(:,:,2) = light_mat_g;
light_mat(:,:,3) = light_mat_b;

imshow(light_mat)


















