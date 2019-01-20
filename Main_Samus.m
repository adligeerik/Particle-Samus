% Load data 
vidObj = VideoReader('TrackingData/Metroid.mp4');
vidObj.CurrentTime = 35; % When the gameplay starts
currAxes = axes;

% Read a frame
vidFrame = readFrame(vidObj);

% Extraxt Samus pixles
samus_pixles = cutSamus();
pzx = pzgivenx(samus_pixles);

% Init values
M = 3000;
biny = 10;
binx = 10;

% Init paricles
[height,width,rgb] = size(vidFrame);
X = initialize_particles(height,width,M);

% Red pixels
r = zeros(M);
r = r + 255;
redpixels = zeros(M,M,3);
redpixels(:,:,1) = r; 
redpixels = uint8(redpixels);

resamp = 1;

Xbar = X;% test


newVid = VideoWriter('samus_particle', 'MPEG-4'); % New
newVid.FrameRate = 30;
newVid.Quality = 100;
open(newVid);




while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    
    %Xbar = Control_input(Xbar,height,width);
    
    [Xbar, mu, resamp] = Particle_filter(Xbar,pzx,height,width,vidFrame,resamp);
    
    for ii = 1: M
        vidFrame(Xbar(ii,2),Xbar(ii,1),:) = [22 250 8];
    end
    vidFrame(mu(2),mu(1),:) = [0 0 255];
    
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(0.1/vidObj.FrameRate);
    writeVideo(newVid,vidFrame)
end

close(newVid)






