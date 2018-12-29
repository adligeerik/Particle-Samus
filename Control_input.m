function [movedX] = Control_input(X,height,width)

len = length(X);
z = zeros(len,1);

stepsize = 3;

%  uniform distribution (try with gauss dist)
steps = randi([-stepsize stepsize], [len 2]);

movedX = X + [steps,z]';

x = movedX(1,:)';
y = movedX(2,:)';

x(x<1) = 1;
y(y<1) = 1;

x(x>width) = width-1;
y(y>height) = height-1;

movedX(1,:) = x';
movedX(2,:) = y';

end

