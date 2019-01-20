function [weights, isdep] = assignweight(positions,pzx,currentframe)

threashold = 150;
isdep = 0;

M = length(positions);
weights = zeros(1,M);
for m = 1:M
    rgb = currentframe(positions(m,2),positions(m,1),:);
    weights(m) = pzx(rgb(1)+1,rgb(2)+1,rgb(3)+1);
end

if sum(weights) <= threashold
    isdep = 1;
end

weights = weights/sum(weights);
end

