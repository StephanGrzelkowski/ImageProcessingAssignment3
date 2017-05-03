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
nrho = 100; 
ntheta = 100; 
h = hough(im,Thresh,nrho , ntheta); 
normHough = h./max(max(h));


figure; 
imshow(normHough)

%% 
