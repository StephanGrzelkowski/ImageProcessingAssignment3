function pts = points_of_line(points , line , epsilon)
% points - an array containing all points
% line - the homogeneous representation of the line
% epsilon - the maximum distance
% returns :
% pts - an array of all points within epsilon of the line

%calculate distance of points to line 

%Normalized 
pts = []; 



for i = 1 : size(points, 2) 
    a = line(1);
    b = line(2); 
    c = line(3); 
    x0 = points(1,i); 
    y0 = points(2,i); 
    
    %calculate perpendicular distance of the point to the line
    % dot product: 
%   dist = dot(line,points(:,i)); 
    dist = dot(line,points(:,i)); 
    %dist = points(i) .* line - delta(i); 
    if abs(dist) <= epsilon 
       pts = [pts, points(:,i)]; 
    end
end


end