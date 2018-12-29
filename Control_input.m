function [movedX] = Control_input(X)

len = length(X);
z = zeros(len,1);

stepsize = 3;

%  uniform distribution (try with gauss dist)
steps = randi([-stepsize stepsize], [len 2]);

movedX = X + [steps,z]';
end

