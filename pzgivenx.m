function p = pzgivenx(samus)
  
p = zeros(256,256,256);

N = length(samus);

samus = samus + [1;1;1];
for ii = 1:N
    p(samus(ii)) = p(samus(ii)) + 1/N;
end

end