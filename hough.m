function h = hough ( im , Thresh , nrho , ntheta )
% HOUGH
%
% Function takes a grey scale image , constructs an edge map by applying
% the Canny detector , and then constructs a Hough transform for finding
% lines in the image .
%
% Usage : h = hough (im , Thresh , nrho , ntheta )
%
% arguments :
% im - The grey scale image to be transformed
% Thresh - A 2 -vector giving the upper and lower
% hysteresis threshold values for edge ()
% nrho - Number of quantised levels of rho to use
% ntheta - Number of quantised levels of theta to use
%
% returns ;
% h - The Hough transform
% ...

edgePoints = edge(im,'canny',Thresh); 
[rows, cols] = size(im); 
rhomax = sqrt ( rows ^2 + cols ^2); % The maximum possible value of rho.
drho = 2* rhomax /( nrho -1); % The increment in rho between successive
% entries in the accumulator matrix .
% Remember we go between + - rhomax .
dtheta = pi / ntheta ; % The increment in theta between entries .
thetas = [0: dtheta :( pi - dtheta )]; % Array of theta values across the
rhos = -rhomax : drho : (rhomax); 





% accumulator matrix .
h = zeros(nrho,ntheta); 
% for each x and y of nonzero edge values :
[y, x] = find(edgePoints == 1);
sthetas = sin(thetas);
cthetas = cos(thetas); 

for i = 1 : length(x)
    rho = x(i).* sthetas - y(i).* cthetas;  
     
    % find closest value in rho
    rhoindex = zeros(1,length(rho)); 
    thetaindex = 1 : ntheta;
    for j = 1 : length(rho)
        rhodiff = abs(rhos - rho(j));
        
        [val,rhoindex(j)] = min(rhodiff);
        
        h(rhoindex(j),thetaindex(j)) = h(rhoindex(j),thetaindex(j)) + 1;

    end

%   rhoindex = round(rho./drho + nrho/2);
    
    %thetaindex = round ( theta / dtheta + 1);
    %h(rhoindex,thetaindex) = h(rhoindex,thetaindex) + 1;

end


end
