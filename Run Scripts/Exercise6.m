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






