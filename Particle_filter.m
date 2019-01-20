function [Xbar,mu,resamp] = Particle_filter(X,pzx,height,width,currentframe, resamp)

resampfreq = 1;

Xbar = zeros(size(X));

X = Control_input(X,height,width);
[Xbar(:,1:2),mu,Sigma] = sample_normal(X,width,height);
[Xbar(:,3), isdep] = assignweight(Xbar(:,1:2),pzx,currentframe);


% Check if particle derivated
if isdep == 1
    [height,width,rgb] = size(currentframe);
    M = length(Xbar);
    Xbar = initialize_particles(height,width,M);
end

if resamp == resampfreq
    Xbar   = Low_variance_sampler(Xbar);
    resamp = 0;
end
resamp = resamp + 1;
end