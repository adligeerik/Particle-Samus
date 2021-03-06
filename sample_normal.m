function [Xbar,mu,Sigma] = sample_normal(X,width,height)
M = length(X);
%weightedpos = (X(:,1:2).*X(:,3));
mu          = round(sum(X(:,1:2))/M);
Sigma       = cov(X(:,1:2));
Xbar        =  round(mvnrnd(mu,Sigma,M));
x = Xbar(:,1);
y = Xbar(:,2);

x(x<1) = 1;
y(y<1) = 1;

x(x>width) = width-1;
y(y>height) = height-1;

Xbar(:,1) = x;
Xbar(:,2) = y;

end