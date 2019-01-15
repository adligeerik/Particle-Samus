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
M = 200;
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


Xbar = X';% test
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    
    Xbar = Control_input(Xbar,height,width)';
    
    Xbar = Particle_filter(X,pzx,height,width,binx,biny,vidFrame);
    
    for ii = 1: M
        vidFrame(Xbar(ii,2),Xbar(ii,1),:) = [255 0 0];
    end

    
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
end






