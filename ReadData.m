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

imshow(rgb)