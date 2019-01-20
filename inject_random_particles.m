function Xbar = inject_random_particles(Xbar,width,height);
M = length(Xbar);
P = 5;

for p = 1:P
    pr = randi(M);
    px = randi(height);
    py = randi(width);
    Xbar(pr,:) = [py,px,0];
    
    
end

end

