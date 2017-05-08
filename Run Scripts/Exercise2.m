clear all 
close all


%% Test hough transform
im = im2double(rgb2gray(imread('shapes.png'))); 

% get rid of the weird black lines on the top and left edges of the image
im(1,:) = 1; 
im(:,1) = 1; 
figure; 
imshow(im)

Thresh = [-0.5, 0.5]; 
%500 gives high accuracy of lines / 100 much faster to implement 
nrho = 100; 
ntheta = 100; 
h = hough(im,Thresh,nrho , ntheta); 
normHough = h./max(max(h));


figure; 
imshow(normHough)

%% houghlines

%gives lines of the form ax+by+c where a, b and c are the rows of lines
lines = houghlines(im, normHough, 0.25); 



%implemented dilation 

%% Dilation of an image. 
se = strel('diamond', 1);
bw = imread('shapes.png');
bw2 = imcomplement(bw);
bw3 = imdilate(bw2, se);
im = bw3./bw2;

[X, Y] = [1, 2];

%implemented dilation 


%% get the points close to a line to fit a line through: 
% get all relevant points with same threshold used in houghlines: 
[y,x] = find(normHough >= 0.25);
% make the points a homogenous list: 
points = [x'; y'; ones(1,length(x))];

%get the points close to a line (test on first line 

epsilon = 50; 
l = points_of_line(points(:,1), lines(:,1), epsilon);


