function Xbar = Particle_filter(X,pzx,height,width,binx,biny,currentframe)
M = length(X)

X = Control_input(X);
histogram = makehistogram(X,height,width,binx,biny);
Xbar = Sample_histogram(histogram );
Xbar(:,3) = assignweight(Xbar(:,1:2),pzx,currentframe);
Xbar   = Low_variance_sampler(Xbar);


end