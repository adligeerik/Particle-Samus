function [pixelsInSamus] = cutSamus()

vidObj = VideoReader('TrackingData/Metroid.mp4');
vidObj.CurrentTime = 40.1; % 35 start
vidFrame = readFrame(vidObj);

rgb = vidFrame(241:288,220:255,:);

k = 8;
[L,C] = imsegkmeans(rgb,k);
J = label2rgb(L,im2double(C));

[h,w,color] = size(J);
J2 = reshape(J,[h*w,color]);
mask = zeros(h*w,1);

C2 = [C(1,:); C(3,:); C(4,:); C(5,:); C(6,:); C(8,:)];

for ii= 1:length(C2)
    for jj = 1:h*w
        if J2(jj,:) == C2(ii,:)
            mask(jj) =  1;        
        end
    end

end
masksamus = reshape(mask,[h,w,1]);

extrapixles = [16 7; 17 7; 16 8; 17 8; 16 9; 17 9; 15 10; 20 10; 18 12; 25 16; 22 31; 22 32; 20 33; 21 33; 22 33; 20 34; 21 34; 22 34];
masksamus(extrapixles(:,2), extrapixles(:,1)) = 1;

masksamus = reshape(masksamus,[h*w,1]);

nrgb = reshape(rgb,[h*w,color]);
%pixelsInSamus = ones(size(nrgb));
kk = 1;
for ii = 1: length(masksamus)
    if masksamus(ii) == 1
        pixelsInSamus(kk,:) = nrgb(ii,:);
        kk = kk + 1;
    end
end
    
end

