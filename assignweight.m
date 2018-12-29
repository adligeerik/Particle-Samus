function weight = assignweight(positions,pzx,currentframe)

M = length(positions);
weights = zeros(1,M);
for m = 1:M
    rgb = currentframe(position(m,1),position(m,2),:);
    weights(m) = pzx(rgb(1),rgb(2),rgb(3));
end

end
