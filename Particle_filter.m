function Xbar = Particle_filter(X,pzx,height,width,binx,biny,currentframe)
M = length(x)
Xbar = zeros(size(X));

X = Control_input(X);
histogram = makehistogram(X,height,width,binx,biny);
Xbar(:,1:2) = Sample_histogram(histogram,height,width,binx,biny,M );
Xbar(:,3) = assignweight(Xbar(:,1:2),pzx,currentframe);
Xbar   = Low_variance_sampler(Xbar);


end