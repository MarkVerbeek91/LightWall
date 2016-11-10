
N = 100;

x = linspace(0,10,N);
y = linspace(0,10,N);

x_offset = 5;
y_offset = 5;

r = sqrt( (repmat(x - x_offset, N, 1)).^2 + (repmat(y - y_offset, N, 1)').^2); 

z = sin(r);


surf(x,y,z)