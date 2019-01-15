function [Xbar,mu] = Particle_filter(X,pzx,height,width,currentframe)

Xbar = zeros(size(X));

M = length(X);


X = Control_input(X,height,width)';
[X(:,1:2),mu,Sigma] = sample_normal(X,width,height)
Xbar(:,3) = assignweight(Xbar(:,1:2),pzx,currentframe);
Xbar   = Low_variance_sampler(Xbar);

end