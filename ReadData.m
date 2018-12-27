v = VideoReader('TrackingData/Metroid.mp4');

while hasFrame(v)
    frame = readFrame(v);
end

whos frame