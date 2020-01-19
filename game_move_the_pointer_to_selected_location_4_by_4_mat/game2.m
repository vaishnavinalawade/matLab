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
vid.FrameGrabInterval = 15;

vid.FramesPerTrigger = 1;

vid.ReturnedColorspace = 'rgb';

xaxis = screenSize(3);
yaxis = screenSize(4);

[clap Fs] = wavread('applause.wav');
start1 = imread('start1.jpg');
l1 = imread('1l.jpg');
s1 = imread('1s.jpg');
l2 = imread('2l.jpg');
s2 = imread('2s.jpg');
l3 = imread('3l.jpg');
s3 = imread('3s.jpg');
l4 = imread('4l.jpg');
s4 = imread('4s.jpg');
l5 = imread('5l.jpg');
s5 = imread('5s.jpg');
l6 = imread('6l.jpg');
s6 = imread('6s.jpg');
l7 = imread('7l.jpg');
s7 = imread('7s.jpg');
l8 = imread('8l.jpg');
s8 = imread('8s.jpg');
l9 = imread('9l.jpg');
s9 = imread('9s.jpg');
l10 = imread('10l.jpg');
s10 = imread('10s.jpg');
l11 = imread('11l.jpg');
s11 = imread('11s.jpg');
l12 = imread('12l.jpg');
s12 = imread('12s.jpg');
l13 = imread('13l.jpg');
s13 = imread('13s.jpg');
l14 = imread('14l.jpg');
s14 = imread('14s.jpg');
l15 = imread('15l.jpg');
s15 = imread('15s.jpg');
l16 = imread('16l.jpg');
s16 = imread('16s.jpg');


xfirst = 90;
yfirst = 90;
xprev = 0;
yprev = 0;
thresh = 10;

prev = 0;
thi = 0;
done = 0;


pos = [0 0 xaxis yaxis];
GameP = vision.VideoPlayer('Name', 'GAME', 'Position', pos); 
step(GameP, start1);


% Set value of a video source object property.
vid_src = getselectedsource(vid);
set(vid_src,'Tag','Eye Tracking');
% vid_src.ZoomMode = 'manual';
% vid_src.Zoom = 140;
% vid_src.BacklightCompensation = 'off';

% Start acquiring frames.
start(vid)

nw = 1;                                                                     % The number of times to calibrate 
                                                                            % the mouse, i.e no of runs wanted
while (nw<2)
   %pt = ceil(rand*16);                                                      % Randomly selects point to look 
     pt = 2;                                                                 % If you specify point to look
    % Chose only one option from line 85 and line 86. Comment the other
    
    while(done==0)
        switch pt
            case 1
                step(GameP, l1);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>=xfirst && x<=xfirst+300 && y>yfirst && y<=yfirst+162)
                    pause(1);
                    step(GameP, s1);                    
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end                
            case 2
                step(GameP, l2);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                 else
                    xprev = x;
                    yprev = y;
                 end
                jRobot.mouseMove(x,y);
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst && y<=yfirst+162)
                    pause(1);
                    step(GameP, s2);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                   end
                   jRobot.mouseMove(x,y);
                   
                    done = 1;
                    nw = nw+1;
                end 
            case 3
                step(GameP, l3);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst && y<=yfirst+162)
                    pause(1);
                    step(GameP, s3);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                  
                    done = 1;
                    nw = nw+1;
                end 
            case 4
               step(GameP, l4);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+900 && x<=xfirst+1200 && y>yfirst && y<=yfirst+162)
                    pause(1);
                    step(GameP, s4);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    done = 1;
                    nw = nw+1;
                end
            case 5
                step(GameP, l5);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>=xfirst && x<=xfirst+300 && y>yfirst+162 && y<=yfirst+325)
                    pause(1);
                    step(GameP, s5);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                   
                    done = 1;
                    nw = nw+1;
                end 
            case 6
                step(GameP, l6);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+162 && y<=yfirst+325)
                    pause(1);
                    step(GameP, s6);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end 
            case 7
                step(GameP, l7);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+162 && y<=yfirst+325)
                    pause(1);
                    step(GameP, s7);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end 
            case 8
                step(GameP, l8);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+900 && x<=xfirst+1200 && y>yfirst+162 && y<=yfirst+325)
                    pause(1);
                    step(GameP, s8);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end 
            case 9
                step(GameP, l9);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>=xfirst && x<=xfirst+300 && y>yfirst+325 && y<=yfirst+487)
                    pause(1);
                    step(GameP, s9);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                   
                    done = 1;
                    nw = nw+1;
                end 
            case 10
                step(GameP, l10);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+325 && y<=yfirst+487)
                    pause(1);
                    step(GameP, s10);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 11
                step(GameP, l11);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+325 && y<=yfirst+487)
                    pause(1);
                    step(GameP, s11);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 12
                step(GameP, l12);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+900 && x<=xfirst+1200 && y>yfirst+325 && y<=yfirst+487)
                    pause(1);
                    step(GameP, s12);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 13
                step(GameP, l13);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>=xfirst && x<=xfirst+300 && y>yfirst+487 && y<=yfirst+650)
                    pause(1);
                    step(GameP, s13);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 14
                step(GameP, l14);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+487 && y<=yfirst+650)
                    pause(1);
                    step(GameP, s14);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 15
                step(GameP, l15);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+487 && y<=yfirst+650)
                    pause(1);
                    step(GameP, s15);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
                case 16
                step(GameP, l16);
                [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                 if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                else
                    xprev = x;
                    yprev = y;
                end
                jRobot.mouseMove(x,y);
                if (x>xfirst+900 && x<=xfirst+1200 && y>yfirst+487 && y<=yfirst+650)
                    pause(1);
                    step(GameP, s16);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    
                    done = 1;
                    nw = nw+1;
                end
        end
    end
    step(GameP, start1);
    pause(1);   
    done = 0;
end

stop(vid)
delete(vid)
disp('GAME OVER');
close(gcf);
    