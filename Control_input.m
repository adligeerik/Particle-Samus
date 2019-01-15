function [movedX] = Control_input(X,height,width)

len = length(X);
z = zeros(len,1);

stepsize = 5;

%  uniform distribution (try with gauss dist)
steps = randi([-stepsize stepsize], [len 2]);

movedX = X + [steps,z]';

x = movedX(1,:)';
y = movedX(2,:)';

x(x<1) = 1;
y(y<1) = 1;

x(x>width) = width;
y(y>height) = height;

movedX(1,:) = x';
movedX(2,:) = y';

end

