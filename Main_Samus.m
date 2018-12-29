% Load data 
vidObj = VideoReader('TrackingData/Metroid.mp4');
vidObj.CurrentTime = 35; % When the gameplay starts

% Read a frame
vidFrame = readFrame(vidObj);

% Extraxt Samus pixles
samus_pixles = cutSamus();

% Init values
M = 100;
biny = 10;
binx = 10;

% Init paricles
[height,width] = size(vidObj);
X_0 = initialize_particles(height,width,M);


while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    
    I = reshape(vidFrame,[h*w,color]);
    
    Xbar = Particle_filter(X,pzx,height,width,binx,biny,currentframe);
    
    vidFrame(Xbar(:,1,1),Xbar(:,2,1)) = [255,0,0];
    
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
end






