%% Find an intersection between two lines

% Using lines created in houghlines 

%intersections can be easily calculated in homogeneous representation as
%the cross product of the two lines


%% Example using the first two lines 
%lines are already normalized 

%get the intersection of the example lines 
intersect_Lines = cross(lines(:,1),lines(:,2)); 

%normalize the intersect point to homogeneous transformation
intersect_LinesNorm = intersect_Lines ./ intersect_Lines(3); 


%% Proportianlaity between intersection point and angle between two lines 


%% Cross product between two points equal the line 


%% Projective transformation 


%% Hough transform to automate transformation 
clear all 
close all

a = rgb2gray(imread('szeliski.png')); 

Thresh = [-0.5, 0.5]; 
nrho = 500; 
ntheta = 500; 
h = hough(a, Thresh, nrho , ntheta); 
normHough = h./max(max(h));

lines = houghlines(a,normHough,0.53);

% get the 4 intersections 

% upper left 
cornerUpperLeft = cross(lines(:,1),lines(:,4));
cornerUpperLeft = cornerUpperLeft ./ cornerUpperLeft(3); 

cornerUpperRight = cross(lines(:,2),lines(:,4));
cornerUpperRight = cornerUpperRight ./ cornerUpperRight(3); 

cornerBottomLeft = cross(lines(:,1),lines(:,3)); 
cornerBottomLeft = cornerBottomLeft ./ cornerBottomLeft(3); 

cornerBottomRight = cross(lines(:,2),lines(:,3)); 
cornerBottomRight = cornerBottomRight ./ cornerBottomRight(3); 

% we can now use this with our old projection file pasted into helperfiles 
%left top, left bottom, right top, right bottom

x = [cornerUpperLeft(1), cornerBottomLeft(1), cornerUpperRight(1), cornerBottomRight(1)];
y = [cornerUpperLeft(2), cornerBottomLeft(2), cornerUpperRight(2), cornerBottomRight(2)];


projection = myProjection(a, x(1),y(1), x(2),y(2),x(3),y(3),x(4),y(4),400,600,'linear', 'basic');

figure; 
subplot(121)
imshow(a)
title('Original')
subplot(122)
imshow(uint8(projection)) 
title('Projection')