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

%get the points close to a line 

% fix the distance
epsilon = 5; 

%save into a struct for each line
pts = {};
for j = 1 : size(lines,2)
    pts{j} = points_of_line(points, lines(:,j), epsilon);
end

%
lines_fitted = [];
for j = 1 : length(pts)
    lines_fitted(j,:) = line_through_points(pts{j});
end

%% plot the first line to check if it approximated correctly

%plot it 
% first line: 
a = lines_fitted(1,1); 
b = lines_fitted(1,2); 
c = lines_fitted(1,3); 

x = 1 : 512;
y = (a .* x + c) ./ -b; 

figure; 
imshow(im); 
hold on 
plot(x,y)
