function p = pzgivenx(samus)

samus = double(samus);

p = zeros(256,256,256);

N = length(samus);

samus = samus + [1 1 1];
for ii = 1:N
    p(samus(ii,1),samus(ii,2),samus(ii,3)) = p(samus(ii,1),samus(ii,2),samus(ii,3)) + 1/N;
end

end 