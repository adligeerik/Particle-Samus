function p = pzgivenx(samus)
b = 3

samus = double(samus);

p = zeros(256+2*b,256+2*b,256+2*b);

N = length(samus);

samus = samus + [1 1 1];
for ii = 1:N
    r = samus(ii,1)+b;
    b = samus(ii,1)+b;
    g = samus(ii,1)+b;
    p(samus(ii,1),samus(ii,2),samus(ii,3)) = p(samus(ii,1),samus(ii,2),samus(ii,3)) + 1;
end


p(1:3,1:3,1:3) = 0;
end 