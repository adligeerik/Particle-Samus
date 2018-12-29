function [movedX] = Control_input(X)

stepsize = 3;

%  uniform distribution (try with gauss dist)
steps = rand([-stepsize stepsize], [1000 2]);

movedX = X + steps;
end

