function [pts] = points_of_line(points , line , epsilon)
% points - an array containing all points
% line - the homogeneous representation of the line
% epsilon - the maximum distance
% returns :
% pts - an array of all points within epsilon of the line

%calculate distance of points to line 

%Normalized 
pts = []; 

for i = 1 : size(points, 1) 
     
    dist = points(i) .* line - delta(i); 
    if dist >= epsilon 
       pts = [pts, points(i)]; 
    end
end


end