function [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst)
%Mouse_Location Summary of this function goes here
%   Detailed explanation goes here

data = getdata(vid,1);
bbox = step(faceDetector, data);
videoFrame = single(data);
videoOut = step(boxInserter, videoFrame,bbox(1,:));
videoOut = uint8(videoOut);
faceImage    = imcrop(data,bbox(1,:)); 
eyeBBox     = step(eyeDetector,faceImage);
hc = [12*bbox(1,3)/88 30*bbox(1,4)/88 26*bbox(1,3)/88 10*bbox(1,4)/88];
eyeBBox = vertcat(eyeBBox,hc);
videoFrame = single(faceImage);
vinos = step(boxInserter, videoFrame,eyeBBox(1,:));
vinos = uint8(vinos);
eyeImage    = imcrop(vinos,eyeBBox(1,:)); 
eyeImage = rgb2gray(eyeImage);
eyeImage = imadjust(eyeImage);
eyeImage = medfilt2(eyeImage, [5 5]);
bwim = im2bw(eyeImage,0.04);
bwim=~bwim;
[m n]=size(bwim);
mask =ones(5,5);
imfinal= imerode(bwim,mask);
[val row] = max(sum(imfinal,1));
[val col] = max(sum(imfinal,2));
x = 1.85*(screenSize(3)-row*screenSize(3)/n) - 120;
x = ceil(x*600/screenSize(3))+xfirst;
y = 1.54 *(col*screenSize(4)/m);
y = ceil(y*600/screenSize(4))+yfirst;


end

