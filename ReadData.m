vidObj = VideoReader('TrackingData/Metroid.mp4');
vidObj.CurrentTime = 40.1; % 35 start

currAxes = axes;
%while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
%end


%Samus 
rgb = vidFrame(241:288,220:255,:);


%% Kmeans samus
k = 8;
[L,C] = imsegkmeans(rgb,k);
J = label2rgb(L,im2double(C));
subplot(1,2,1)
imshow(rgb)
subplot(1,2,2)
imshow(J)


%% Histogram

[h,w,color] = size(J)

J2 = reshape(J,[h*w,color]);

for ii= 1:k
    kk = 0;
    for jj = 1:h*w
        if J2(jj,1) == C(ii,1)
            kk = kk+1;
        
        end
    end
Tot(ii) = kk;
end
subplot(1,2,1)
bar(Tot)