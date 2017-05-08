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
% se = strel('diamond', 1);
% bw = imread('shapes.png');
% bw2 = imcomplement(bw);
% bw3 = imdilate(bw2, se);
% im = bw3./bw2;
% 
% [X, Y] = find(im == 1);
% 
% %implemented dilation 


%% get the points close to a line to fit a line through: 
%transform lines into homogenous representation

for i = 1 : size(lines,2)
    lines(1:3,i) = lines(1:3,i) ./ (sqrt(lines(1,i)^2 + lines(2,i)^2));
end

% get all relevant points with the same method as in hough: 
edgePoints = edge(im,'canny',Thresh);
[y, x] = find(edgePoints == 1);
% make the points a homogenous list: 

points = [x'; y'; ones(1,length(x))];

%get the points close to a line (test on first line 
% fix the distance
epsilon = 5; 
pts = {};
for j = 1 : size(lines,2)
    pts{j} = points_of_line(points, lines(:,j), epsilon);
end

%
lines_fitted = [];
for j = 1 : length(pts)
    lines_fitted(j,:) = line_through_points(pts{j});
end

%plot it 
% first line: 
a = lines_fitted(2,1); 
b = lines_fitted(2,2); 
c = lines_fitted(2,3); 
% 
% x = 1 : 512;
% y = (a .* x + c) ./ -b; 
y = 1 : 512; 
x = (b .* y + c) ./ -a; 
figure; 
imshow(im); 
hold on 
plot(x,y)

