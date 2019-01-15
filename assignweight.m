function weight = assignweight(positions,pzx,currentframe)

M = length(positions)
weights = zeros(1,M);
for m = 1:M
    rgb = currentframe(positions(m,1),positions(m,2),:);
    weights(m) = pzx(rgb(1) +1,rgb(2)+1,rgb(3)+1);
end

end

