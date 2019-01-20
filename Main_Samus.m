% Load data 
vidObj = VideoReader('TrackingData/Metroid.mp4');
vidObj.CurrentTime = 40.1; % When the gameplay starts
currAxes = axes;

% Read a frame
vidFrame = readFrame(vidObj);

% Extraxt Samus pixles
samus_pixles = cutSamus();
pzx = pzgivenx(samus_pixles);

% Init values
M = 2000;
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


Xbar = X;% test
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    
    %Xbar = Control_input(Xbar,height,width);
    
    [Xbar, mu] = Particle_filter(Xbar,pzx,height,width,vidFrame);
    
    for ii = 1: M
        vidFrame(Xbar(ii,2),Xbar(ii,1),:) = [255 0 0];
    end
    vidFrame(mu(2),mu(1),:) = [0 0 255];
    
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
end






