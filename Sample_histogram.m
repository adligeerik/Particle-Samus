function Xpos = Sample_histogram(histogram,height,width,binx,biny,M )
binpix = width/binx;
binpiy = height/biny;
Xpos   = zeros(M,2);

probabilitydensity = zeros(binx,biny);
w = 0;
for ii = 1:binx
    for jj = 1:biny
        w = w + histogram(ii,jj);
        probabilitydensity(ii,jj) = w;
    end
end

for m = 1:M
    r = rand;
    for ii = 1:binx
        for jj = 1:biny
            c = probabilitydensity(ii,jj);
            if r <= c
                Xpos(m,1) = (ii-1)*binpix + 1 + int8(rand*(binpix-1));
                Xpos(m,2) = (jj-1)*binpiy + 1 + int8(rand*(binpiy-1));
                break
            end       
        end
        if r <= c
            break
        end
    end   
end

end