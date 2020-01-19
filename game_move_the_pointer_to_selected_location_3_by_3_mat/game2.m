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
m1 = imread('1m.jpg');
s1 = imread('1s.jpg');
l2 = imread('2l.jpg');
m2 = imread('2m.jpg');
s2 = imread('2s.jpg');
l3 = imread('3l.jpg');
m3 = imread('3m.jpg');
s3 = imread('3s.jpg');
l4 = imread('4l.jpg');
m4 = imread('4m.jpg');
s4 = imread('4s.jpg');
l5 = imread('5l.jpg');
m5 = imread('5m.jpg');
s5 = imread('5s.jpg');
l6 = imread('6l.jpg');
m6 = imread('6m.jpg');
s6 = imread('6s.jpg');
l7 = imread('7l.jpg');
m7 = imread('7m.jpg');
s7 = imread('7s.jpg');
l8 = imread('8l.jpg');
m8 = imread('8m.jpg');
s8 = imread('8s.jpg');
l9 = imread('9l.jpg');
m9 = imread('9m.jpg');
s9 = imread('9s.jpg');


xfirst = 240;
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
   %pt = ceil(rand*9);                                                      % Randomly selects point to look 
   pt = 1;                                                                 % If you specify point to look
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
                if (x>=xfirst && x<=xfirst+300 && y>=yfirst && y<=yfirst+220)
                    pause(1);
                    step(GameP, m1);                    
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>=xfirst && x<=xfirst+300 && y>=yfirst && y<=yfirst+220)
                        pause(1);
                        step(GameP, s1);
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    done = 1;
                    nw = nw+1;
                    end  
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
                if (x>xfirst+300 && x<=xfirst+600 && y>=yfirst && y<=yfirst+220)
                    pause(1);
                    step(GameP, m2);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                   end
                    
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+300 && x<=xfirst+600 && y>=yfirst && y<=yfirst+220)
                        pause(1);
                        step(GameP, s2);
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end 
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
                if (x>xfirst+600 && x<=xfirst+900 && y>=yfirst && y<=yfirst+220)
                    pause(1);
                    step(GameP, m3);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+600 && x<=xfirst+900 && y>=yfirst && y<=yfirst+220)
                        pause(1);
                        step(GameP, s3);
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end 
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
                if (x>=xfirst && x<=xfirst+300 && y>yfirst+220 && y<=yfirst+440)
                    pause(1);
                    step(GameP, m4);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>=xfirst && x<=xfirst+300 && y>yfirst+220 && y<=yfirst+440)
                        pause(1);
                        step(GameP, s4);                 
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end 
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
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+220 && y<=yfirst+440)
                    pause(1);
                    step(GameP, m5);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+220 && y<=yfirst+440)
                        pause(1);
                        step(GameP, s5);                        
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end 
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
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+220 && y<=yfirst+440)
                    pause(1);
                    step(GameP, m6);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+220 && y<=yfirst+440)
                        pause(1);
                        step(GameP, s6);                      
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end
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
                if (x>=xfirst && x<=xfirst+300 && y>yfirst+440 && y<=yfirst+660)
                    pause(1);
                    step(GameP, m7);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>=xfirst && x<=xfirst+300 && y>yfirst+440 && y<=yfirst+660)
                        pause(1);
                        step(GameP, s7);                 
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end
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
                if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+440 && y<=yfirst+660)
                    pause(1);
                    step(GameP, m8);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+300 && x<=xfirst+600 && y>yfirst+440 && y<=yfirst+660)
                        pause(1);
                        step(GameP, s8);                 
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end 
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
                if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+440 && y<=yfirst+660)
                    pause(1);
                    step(GameP, m9);
                    [x,y] = Mouse_Location(vid,faceDetector,boxInserter,eyeDetector,screenSize,xfirst,yfirst);
                    if (sqrt((x-xprev)^2+(y-yprev)^2)<thresh)
                    x = xprev;
                    y = yprev;
                    else
                    xprev = x;
                    yprev = y;
                    end
                    jRobot.mouseMove(x,y);
                    if (x>xfirst+600 && x<=xfirst+900 && y>yfirst+440 && y<=yfirst+660)
                        pause(1);
                        step(GameP, s9);                 
                        soundsc(clap,Fs);
                        done = 1;
                        nw = nw+1;
                    end
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
    