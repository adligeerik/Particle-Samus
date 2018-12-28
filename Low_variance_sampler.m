function Xbar = Low_variance_sampler(particles)

Xbar = zeros(size(particles));
M    = length(particles);
r    = rand/M;
c    = particles(1,3);
ii = 1;
for m = 1:M
    U = r +(m-1)/M;
    while U > c
        ii = ii+1;
        c = c + particles(ii,3);
    end
    Xbar(m,:) = particles(ii,:);
end

end