%% houghlines

%gives lines of the form ax+by+c where a, b and c are the rows of lines
lines = houghlines(im, normHough, 0.25); 


%% Dilation of an image. 

% Not fully implemented due to lack of time
se = strel('diamond', 1);
bw = imread('shapes.png');
bw2 = imcomplement(bw);
bw3 = imdilate(bw2, se);
imDil = bw3./bw2;

[X, Y] = find(imDil == 1);



