clear
clc
close all
dataDir = './data';
inFile = fullfile(dataDir,'Butterflies.mp4');

vid = VideoReader(inFile);
    % Extract video info
    vidHeight = vid.Height;
    vidWidth = vid.Width;
    nChannels = 3;
    fr = vid.FrameRate;
    len = vid.NumFrames;
    temp = struct('cdata', zeros(vidHeight, vidWidth, nChannels, 'uint8'), 'colormap', []);
    startIndex = 1;
    endIndex = len;
   [~,vidName] = fileparts('Butterflies.mp4');
    outName = fullfile(dataDir,[vidName 'crop' '.avi']);
    vidOut = VideoWriter(outName);
    vidOut.FrameRate = fr;
    open(vidOut)
    disp('Rendering...')
    % output video
       tic
    for i=1:300
        temp.cdata = read(vid, i);
        [rgbframe,~] = frame2im(temp);
        rgbframe = im2double(rgbframe);
        frame = rgb2ntsc(rgbframe);
        if(i==200)
        imshow(rgbframe)
        end
        writeVideo(vidOut,rgbframe);
        i;
     end
    toc
    close(vidOut);