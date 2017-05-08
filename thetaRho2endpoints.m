function [x1 , y1 , x2 , y2] = thetaRho2endpoints (theta , rho , rows , cols )
%THETARHO2ENDPOINTS Summary of this function goes here
%   Detailed explanation goes here

%calculate y1 and y2 for horizontal and diagonal lines
x1 = 1; 
x2 = cols; 
y1 = -rho / cos(theta); 
y2 = (x2*sin(theta) - rho) / cos(theta); 

if y1 < 1 || y2 < 1 %vertical line 
   y1 = 1; 
   x1 = rho/sin(theta); 
   y2 = rows; 
   x2 = (rho + y2 *cos(theta)) / sin(theta); 
end

end

