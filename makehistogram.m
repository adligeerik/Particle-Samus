function histogram = makehistogram(particles,height,width,binx,biny)

binx = width/binx;
biny = height/biny;

histogram = zeros(binx,biny);

particles(:,1) = ceil(particles(:,1)/binx);
particles(:,2) = ceil(particles(:,2)/biny );

for ii = 1:length(particles)
    x = particles(ii,1);
    y = particles(ii,2);
    w = particles(ii,3);
    histogram(x,y) = histogram(x,y) + w;
    
end 

histogram = histogram/sum(histogram,'all');
end