function [lines] = houghlines(im , h, thresh )
% HOUGHLINES
%
% Function takes an image and its Hough transform , finds the
% significant lines and draws them over the image
%
% Usage : houghlines (im , h, thresh )
%
% arguments :
% im -      The original image
% h -       Its Hough Transform
% thresh -  The threshold level to use in the Hough Transform
%           to decide whether an edge is significant
% 
% Output : 
% lines -   returns the lines matrix where every column is a line
%           representation in homogenous form
% 
% points -  the edgepoints of the lines used to calculate the lines with rows
%           corresponding to x1,y1,x2,y2 

%recalculate drho and dtheta
[rowsI, colsI] = size(im); 
rhomax = sqrt ( rowsI ^2 + colsI ^2);

[rowsH, colsH] = size(h);
nrho = rowsH; 
ntheta = colsH;

drho = 2* rhomax /( nrho -1);
dtheta = pi / ntheta; 

thetas = 0 : dtheta : pi - dtheta; 
rhos = -rhomax : drho : rhomax; 

hThresh = zeros(size(h)); 
idxThresh = find(h >= thresh); 
hThresh(idxThresh) = h(idxThresh); 

[bwl, nregions] = bwlabel(hThresh);
% rhoList = zeros(1,nregions); 
% thetaList = zeros(1,nregions); 


points = zeros(4,nregions); 

lines = zeros(3,nregions); 

for n = 1 : nregions
    mask = bwl == n; % Form a mask for each region .
    
    region = mask.* h; % Point - wise multiply mask by Hough Transform
    % to give you an image with just one region of
    % the Hough Transform .
    [rhoIdx, thetaIdx] = find(region == max(max(region))); 
%     rhoList(n) = rhos(rhoIdx); 
%     thetaList(n) = thetas(thetaIdx); 
    [x1, y1, x2, y2] = thetaRho2endpoints(thetas(thetaIdx), rhos(rhoIdx), rowsI, colsI); 

    points(1,n) = x1; 
    

    points(2,n) = y1;
    

    points(3,n) = x2; 
    

    points(4,n) = y2; 
    
    lines(:,n) = cross([x1,y1,1], [x2,y2,1]);
    
end

figure;
imshow(im)

for i = 1 : nregions
   hold on
   plot([points(1,i), points(3,i)],[points(2,i), points(4,i)])
end
hold off 


end