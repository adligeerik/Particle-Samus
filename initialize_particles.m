function X_0 = initialize_particles(height,width,M)

x    = randi(width,1,M);
y    = randi(height,1,M);
X_0  = [x;y;ones(1,M)/M];

end 