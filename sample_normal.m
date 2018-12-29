function [Xbar,mu,Sigma] = sample_normal(X,width,height)
M = length(X)
weightedpos = (X(:,1:2).*X(:,3));
mu          = sum(weightedpos);
Sigma       = cov(M*weightedpos);
Xpos        =  mvnrnd(MU,SIGMA,M);

end