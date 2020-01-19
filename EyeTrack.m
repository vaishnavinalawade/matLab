clc;
clear all;
close all;

jRobot = java.awt.Robot; % Initialize the JAVA robot
screenSize = get(0,'ScreenSize'); % Acquire system screensize
faceDetector = vision.CascadeObjectDetector();
eyeDetector = vision.CascadeObjectDetector('RightEyeCART');
boxInserter  = vision.ShapeInserter('BorderColor','Custom',...
    'CustomBorderColor',[255 255 0]);

vid = videoinput('winvideo', 1, 'YUY2_640x480');
% vid = videoinput('winvideo', 1, 'RGB24_320x240');


% Set video input object properties for this application.
% Note that example uses both SET method and dot notation method.

set(vid,'TriggerRepeat',Inf);
vid.FrameGrabInterval = 15;

vid.FramesPerTrigger = 1;

vid.ReturnedColorspace = 'rgb';

% Set value of a video source object property.
vid_src = getselectedsource(vid);
set(vid_src,'Tag','Eye Tracking');
% vid_src.ZoomMode = 'manual';
% vid_src.Zoom = 140;
% vid_src.BacklightCompensation = 'off';

% Create a figure window.
figure; 

% Start acquiring frames.
start(vid)

% Calculate difference image and display it.
% while(vid.FramesAcquired<=25) % Stop after 25 frames
%     data = getdata(vid,1);
%     bbox = step(faceDetector, data);
%     videoFrame = single(data);
%     videoOut = step(boxInserter, videoFrame,bbox(1,:));
%     videoOut = uint8(videoOut);
%     subplot(2,2,1);
%     imshow(videoOut); 
%     faceImage    = imcrop(data,bbox(1,:)); 
%     eyeBBox     = step(eyeDetector,faceImage);
%     videoFrame = single(faceImage);
%     vinos = step(boxInserter, videoFrame,eyeBBox);
%     vinos = uint8(vinos);
%     subplot(2,2,2);
%     imshow(vinos);
%     title('Detected face');
%     
%     eyeImage    = imcrop(vinos,eyeBBox(1,:)); 
%     subplot(2,2,3);
%     imshow(eyeImage);
%     eyeImage = rgb2gray(eyeImage);
%     bwim = im2bw(eyeImage,0.10);
%     bwim=~bwim;
%     subplot(2,2,4);
%     imshow(bwim); 
%     mask =ones(3,3);
%     imfinal= imerode(bwim,mask);
%     %     subplot(1,2,2);
%     %     imshow(imfinal); 
%     vid.FramesAcquired
%     find(1==imfinal(:))
%     pause(0.5);
% end


while(vid.FramesAcquired<=150) % Stop after 50 frames
    if(vid.FramesAcquired>5)
        vid.FramesAcquired
    data = getdata(vid,1);
    bbox = step(faceDetector, data);
    videoFrame = single(data);
    videoOut = step(boxInserter, videoFrame,bbox(1,:));
    videoOut = uint8(videoOut);
    subplot(2,2,1);
    imshow(videoOut); 
    faceImage    = imcrop(data,bbox(1,:)); 
    eyeBBox     = step(eyeDetector,faceImage);
    hc = [12*bbox(1,3)/88 30*bbox(1,4)/88 26*bbox(1,3)/88 10*bbox(1,4)/88];
    eyeBBox = vertcat(eyeBBox,hc);
    videoFrame = single(faceImage);
    vinos = step(boxInserter, videoFrame,eyeBBox(1,:));
    vinos = uint8(vinos);
    subplot(2,2,2);
    imshow(vinos);
    title('Detected face');
    
    eyeImage  = imcrop(vinos,eyeBBox(1,:)); 
    subplot(2,2,3);
    %[centerspupil, radiipupil, metricpupil] = imfindcircles(eyeImage,[30 40], ...
    %'ObjectPolarity','dark','Sensitivity',0.92,'EdgeThreshold',0.1);
   % viscircles(centerspupil,radiipupil);
    imshow(eyeImage);
    eyeImage = rgb2gray(eyeImage);
    eyeImage = imadjust(eyeImage);
    eyeImage = medfilt2(eyeImage, [3 3]);
    bwim = im2bw(eyeImage,0.01);
    %bwim = imguidedfilter(bwim);
    bwim = bwareaopen(bwim, 300);
    bwim=~bwim;
    [m n]=size(bwim);
    subplot(2,2,4);
    imshow(bwim); 
    mask =ones(5,5);
    imfinal= imerode(bwim,mask);
   % bw = bwlabel(imfinal, 8);
   % imfinal = regionprops(imfinal, 'Centroid');
   % imfinal = regionprops(imfinal, 'BoundingBox', 'Centroid');        
            
    %    - subplot(1,2,2);
    %   -  imshow(imfinal); 
%     -vid.FramesAcquired
%    - a = find(1==imfinal(:))
   [val row] = max(sum(imfinal,1));
   [val col] = max(sum(imfinal,2));
     
%    - screenSize(3)-median(a)*screenSize(3)/(m*n)
   %jRobot.mouseMove(screenSize(3)-row*screenSize(3)/n, col*screenSize(4)/m);
     %-jRobot.mouseMove(screenSize(3)-row*screenSize(3)/n, col*screenSize(4)/m);
%   - jRobot.mouseMove(1.5*centroidRed(:,1)*screenSize(3)/m, 1.5*centroidRed(:,2)*screenSize(4)/n);
 x = 1.87*(screenSize(3)-row*screenSize(3)/n)-340;
 y = (1.54*col*screenSize(4)/m)- 150;  
  
    jRobot.mouseMove(x,y);
    %pause(0.0001);
    else
        data = getdata(vid,1)
    end
end
stop(vid)
delete(vid)

clear all
% clear
close(gcf)