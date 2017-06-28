%% This script creates a simple GUI for annotating grasp bounding boxes on images
%
%  Author: Fu-Jen Chu
%  Created date: 2017/06/27
%
%  usage:
%    1. put your images in data/Images/; and run this script to see a simple GUI
%    2. click vertexes of a rectangle clock-wisely (first one is the upper-left corner); three vertexes are enough for a rotated rectangle
%    3. draw as many as you want on a single image; click Next for next image
%    
%  note:
%    1. all rotated rectanges for an image will be saved in data/Annoatations/
%    2. four vertexes represent a rectangle in the annotation (same as Cornell dataset)
%
%%

close all
clear

% set up path
addpath('data/')
imgDataDir = 'data/Images/';
annoDataDir = 'data/Annotations/';
imgFiles = dir([imgDataDir  '*.png']);

% main loop
for imgidx = 1:length(imgFiles) 

    % open image and annotation 
    imgName = imgFiles(imgidx).name;
    [pathstr,imgname] = fileparts(imgName);
    im = imread([imgDataDir imgName]);
    annofileID = fopen([ annoDataDir imgname '_annotations.txt'],'w');

    % open gui
    figure();
    imshow(im);
    hold on;

    % bbox annotations
    H = uicontrol('Style', 'PushButton','String', 'Next','Callback', 'delete(gcbf)');
    while(ishandle(H))  
        % get x and y
        [x y] = ginput(1);
        hold off; imshow(im); hold on;
        plot(x, y, 'ro', 'MarkerSize', 2);

        % get width and angle
        [x2 y2] = ginput(1);
        width = sqrt((x-x2)^2 + (y-y2)^2);
        angle = atan((y2-y)/(x2-x));
        angle = angle/pi*180;
        plot([x x2], [y y2], '-ro', 'MarkerSize', 2);

        % get height
        [x3 y3] = ginput(1);
        height = sqrt((x3-x2)^2 + (y3-y2)^2);

        % draw rotated rectangle
        XY = rectangle_w_angle(x, y, width, height, angle);

        % write to file
        for idx = 1:4
          fprintf(annofileID, '%s\n', [num2str(XY(1,idx)) ' ' num2str(XY(2,idx))]);  
        end

        pause(2);
    end

end