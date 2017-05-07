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
nrho = 500; 
ntheta = 500; 
h = hough(im,Thresh,nrho , ntheta); 
normHough = h./max(max(h));


figure; 
imshow(normHough)

%% houghlines

[x1List, x2List, y1List, y2List] = houghlines(im, normHough, 0.25); 

%% Dilation of an image. 
se = strel('diamond', 1);
bw = imread('shapes.png');
bw2 = imcomplement(bw);
bw3 = imdilate(bw2, se);
im = bw3./bw2;
[X, Y] = 
