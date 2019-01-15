function Xbar = Particle_filter(X,pzx,height,width,binx,biny,currentframe)

Xbar = zeros(size(X));

M = length(X);

X = Control_input(X,height,width);
histogram = makehistogram(X,height,width,binx,biny);
Xbar(:,1:2) = Sample_histogram(histogram,height,width,binx,biny,M );
Xbar(:,3) = assignweight(Xbar(:,1:2),pzx,currentframe);
Xbar   = Low_variance_sampler(Xbar);

end