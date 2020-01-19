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
%vid = videoinput('winvideo', 1, 'RGB24_320x240');


% Set video input object properties for this application.
% Note that example uses both SET method and dot notation method.
set(vid,'TriggerRepeat',Inf);
vid.FrameGrabInterval = 20;

vid.FramesPerTrigger = 1;

vid.ReturnedColorspace = 'rgb';

xaxis = screenSize(3);
yaxis = screenSize(4);

[clap Fs] = wavread('applause.wav');
start1 = imread('start1.jpg');
one = imread('1.jpg');
s1 = imread('1s.jpg');
two = imread('2.jpg');
s2 = imread('2s.jpg');
three = imread('3.jpg');
s3 = imread('3s.jpg');
four = imread('4.jpg');
s4 = imread('4s.jpg');
five = imread('5.jpg');
s5 = imread('5s.jpg');
six = imread('6.jpg');
s6 = imread('6s.jpg');
seven = imread('7.jpg');
s7 = imread('7s.jpg');
eight = imread('8.jpg');
s8 = imread('8s.jpg');
nine = imread('9.jpg');
s9 = imread('9s.jpg');
ten = imread('10.jpg');
s10 = imread('10s.jpg');
eleven = imread('11.jpg');
s11 = imread('11s.jpg');
twelve = imread('12.jpg');
s12 = imread('12s.jpg');
thirteen = imread('13.jpg');
s13 = imread('13s.jpg');
fourteen = imread('14.jpg');
s14 = imread('14s.jpg');
fifteen = imread('15.jpg');
s15 = imread('15s.jpg');
sixteen = imread('16.jpg');
s16 = imread('16s.jpg');
on = imread('19.jpg');
tt = imread('210.jpg');
te = imread('311.jpg');
ft = imread('412.jpg');
fth = imread('513.jpg');
sf = imread('614.jpg');
sfi = imread('715.jpg');
es = imread('816.jpg');


%xfirst = 210;
%yfirst = 110;

xfirst = 90;
yfirst = 90;
xprev = 0;
yprev = 0;
thresh = 8;

prev = 0;
thi = 0;
done = 0;
score = 0;


pos = [0 0 xaxis yaxis];
GameP = vision.VideoPlayer('Name', 'GAME', 'Position', pos); 
step(GameP, start1);


% Set value of a video source object property.
vid_src = getselectedsource(vid);
set(vid_src,'Tag','Eye Tracking');
%vid_src.ZoomMode = 'manual';
% vid_src.Zoom = 140;
% vid_src.BacklightCompensation = 'off';

% Start acquiring frames.
start(vid)


nw = 1;
while (vid.FramesAcquired<30)
    if(vid.FramesAcquired>5)
%         vid.FramesAcquired
    data = getdata(vid,1);
    bbox = step(faceDetector, data);
    videoFrame = single(data);
    videoOut = step(boxInserter, videoFrame,bbox(1,:));
    videoOut = uint8(videoOut);
%     subplot(2,2,1);
%     imshow(videoOut); 
    faceImage    = imcrop(data,bbox(1,:)); 
    eyeBBox     = step(eyeDetector,faceImage);
    hc = [12*bbox(1,3)/88 30*bbox(1,4)/88 26*bbox(1,3)/88 10*bbox(1,4)/88];
    eyeBBox = vertcat(eyeBBox,hc);
    videoFrame = single(faceImage);
    vinos = step(boxInserter, videoFrame,eyeBBox(1,:));
    vinos = uint8(vinos);
%     subplot(2,2,2);
%     imshow(vinos);
%     title('Detected face');
    
    eyeImage = imcrop(vinos,eyeBBox(1,:)); 
%     subplot(2,2,3);
%     imshow(eyeImage);
    eyeImage = rgb2gray(eyeImage);
 %   eyeImage = medfilt2(eyeImage, [3 3]);
    eyeImage = imadjust(eyeImage);
    eyeImage = wiener2(eyeImage,[5 5]);
    bwim = im2bw(eyeImage,0.08);
   % bwim = imguidedfilter(bwim);
    %bwim = bwareaopen(bwim,100);
    bwim=~bwim;
    [m n]=size(bwim);
%     subplot(2,2,4);
%    imshow(bwim); 
    mask =ones(3,3);
    imfinal= imerode(bwim,mask);
    %     subplot(1,2,2);
    %     imshow(imfinal); 
%     vid.FramesAcquired
%     a = find(1==imfinal(:))
    [val row] = max(sum(imfinal,1));
    [val col] = max(sum(imfinal,2));
    x = 1.87*(screenSize(3)-row*screenSize(3)/n)- 140;
    x = ceil(x*600/screenSize(3))+xfirst;
    y = 1.54 *(col*screenSize(4)/m) - 30;
    y = ceil(y*600/screenSize(4))+yfirst;
%     screenSize(3)-median(a)*screenSize(3)/(m*n)
   % jRobot.mouseMove(x+130,y-20);
   if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
   else
                    xprev = x;
                    yprev = y;
   end
   jRobot.mouseMove(x,y);
    
   if (x>=xfirst && x<=xfirst+300 && y>yfirst && y<=yfirst+162)
%         disp('1');
        r = 'r1';
        thi = 1;
    elseif(x>xfirst+300 && x<=xfirst+600 && y>yfirst && y<=yfirst+162)
%         disp('2');
        r = 'r2';
        thi = 2;
    elseif(x>xfirst+600 && x<=xfirst+900 && y>yfirst && y<=yfirst+162)
%         disp('3');        
        r = 'r3';
        thi = 3;
    elseif(x>xfirst+900 && x<=xfirst+1200 && y>yfirst && y<=yfirst+162)
%         disp('4');        
        r = 'r4';
        thi = 4;
    elseif(x>=xfirst && x<=xfirst+300 && y>yfirst+162 && y<=yfirst+325)
%         disp('5');        
        r = 'r5';
        thi = 5;
    elseif(x>xfirst+300 && x<=xfirst+600 && y>yfirst+162 && y<=yfirst+325)
%         disp('6');        
        r = 'r6';
        thi = 6;
    elseif(x>xfirst+600 && x<=xfirst+900 && y>yfirst+162 && y<=yfirst+325)
%         disp('7');        
        r = 'r7';
        thi = 7;
    elseif(x>xfirst+900 && x<=xfirst+1200 && y>yfirst+162 && y<=yfirst+325)
%         disp('8');        
        r = 'r8';
        thi = 8;
    elseif(x>=xfirst && x<=xfirst+300 && y>yfirst+325 && y<=yfirst+487)
%         disp('9');        
        r = 'r9';
        thi = 9;
    elseif(x>xfirst+300 && x<=xfirst+600 && y>yfirst+325 && y<=yfirst+487)
%         disp('10');        
        r = 'r10';
        thi = 10;
    elseif(x>xfirst+600 && x<=xfirst+900 && y>yfirst+325 && y<=yfirst+487)
%         disp('11');        
        r = 'r11';
        thi = 11;
    elseif(x>xfirst+900 && x<=xfirst+1200 && y>yfirst+325 && y<=yfirst+487)
%         disp('12');        
        r = 'r12';
        thi = 12;
    elseif(x>=xfirst && x<=xfirst+300 && y>yfirst+487 && y<=yfirst+650)
%         disp('13');        
        r = 'r13';
        thi = 13;  
    elseif(x>xfirst+300 && x<=xfirst+600 && y>yfirst+487 && y<=yfirst+650)
%         disp('14');        
        r = 'r14';
        thi = 14;
    elseif(x>xfirst+600 && x<=xfirst+900 && y>yfirst+487 && y<=yfirst+650)
%         disp('15');        
        r = 'r15';
        thi = 15;
    elseif(x>xfirst+900 && x<=xfirst+1200 && y>yfirst+487 && y<=yfirst+650)
%         disp('16');       
        r = 'r16';
        thi = 16;
    else
%         disp('none');
        r = 'r0';
    end
    
    switch r
        case 'r1'
%             disp('1 selected');   
            step(GameP,s1);
            pause(0.5);
            step(GameP, one);
            if(prev == 9 && thi == 1)
                step(GameP, on);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end                
            prev = 1;
        case 'r2'
%             disp('2 selected');  
            step(GameP,s2);
            pause(0.5);
            step(GameP, two);            
            if(prev == 10 && thi == 2)
                step(GameP, tt);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 2;
        case 'r3'
%             disp('3 selected');
            step(GameP,s3);
            pause(0.5);
            step(GameP, three);            
            if(prev == 11 && thi == 3)
                step(GameP, te);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 3;
        case 'r4'
%             disp('4 selected'); 
            step(GameP,s4);
            pause(0.5);
            step(GameP, four);            
            if(prev == 12 && thi == 4)
                step(GameP, ft);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 4;
        case 'r5'
%             disp('5 selected');  
            step(GameP,s5);
            pause(0.5);
            step(GameP, five);            
            if(prev == 13 && thi == 5)
                step(GameP, fth);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 5;
        case 'r6'
%             disp('6 selected');  
            step(GameP,s6);
            pause(0.5);
            step(GameP, six);
            if(prev == 14 && thi == 6)
                step(GameP, sf);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end            
            prev = 6;
        case 'r7'
%             disp('7 selected'); 
            step(GameP,s7);
            pause(0.5);
            step(GameP, seven);
            if(prev == 15 && thi == 7)
                step(GameP, sfi);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 7;
        case 'r8'
%             disp('8 selected'); 
            step(GameP,s8);
            pause(0.5);
            step(GameP, eight);
            if(prev == 16 && thi == 8)
                step(GameP, es);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 8;
        case 'r9'
%             disp('9 selected'); 
            step(GameP,s9);
            pause(0.5);
            step(GameP, nine);
            if(prev == 1 && thi == 9)
                step(GameP, on);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 9;
        case 'r10'
%             disp('10 selected');
            step(GameP,s10);
            pause(0.5);
            step(GameP, ten);
            if(prev == 2 && thi == 10)
                step(GameP, tt);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 10;
        case 'r11'
%             disp('11 selected');   
            step(GameP,s11);
            pause(0.5);
            step(GameP, eleven);
            if(prev == 3 && thi == 11)
                step(GameP, te);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 11;
        case 'r12'
%             disp('12 selected'); 
            step(GameP,s12);
            pause(0.5);
            step(GameP, twelve);
            if(prev == 4 && thi == 12)
                step(GameP, ft);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 12;
        case 'r13'
%             disp('13 selected');  
            step(GameP,s13);
            pause(0.5);
            step(GameP, thirteen);
            if(prev == 5 && thi == 13)
                step(GameP, fth);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 13;
        case 'r14'
%             disp('14 selected'); 
            step(GameP,s14);
            pause(0.5);
            step(GameP, fourteen);
            if(prev == 6 && thi == 14)
                step(GameP, sf);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 14;
        case 'r15'
%             disp('15 selected');  
            step(GameP,s15);
            pause(0.5);
            step(GameP, fifteen);
            if(prev == 7 && thi == 15)
                step(GameP, sfi);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 15;
        case 'r16'
%             disp('16 selected');   
            step(GameP,s16);
            pause(0.5);
            step(GameP, sixteen);
            if(prev == 8 && thi == 16)
                step(GameP, es);
                soundsc(clap,Fs);
                score = score+1;
                done = 1;
                pause(0.1);
            end
            prev = 16;
        case 'r0'
%             disp('none selected');
            step(GameP, start1);
    end
    if (done==1)
        done = 0;
        step(GameP, start1);
    end        
    %pause(1);
    else
        data = getdata(vid,1);
    end    
    
end
stop(vid)
delete(vid)
disp('GAME OVER');
disp(['The score is ',num2str(score)]);
h = msgbox(['Game Over. Your score : ',num2str(score)]); 
close(gcf);
                