function p = pzgivenx(samus)

samus = double(samus);

b = 5;

p = zeros(256+2*b,256+2*b,256+2*b);

N = length(samus);

samus = samus + [1 1 1];

adding = ones(2*b+1,2*b+1,2*b+1); 
adding(b+1,b+1,b+1) = 2;
for ii = 1:N

    p(samus(ii,1):samus(ii,1)+2*b,samus(ii,2):samus(ii,2)+2*b,samus(ii,3):samus(ii,3)+2*b) = p(samus(ii,1):samus(ii,1)+2*b,samus(ii,2):samus(ii,2)+2*b,samus(ii,3):samus(ii,3)+2*b) + adding;
end
p = p(b+1:256+b,b+1:256+b,b+1:256+b);

p(1:3,1:3,1:3) = 0;
end 