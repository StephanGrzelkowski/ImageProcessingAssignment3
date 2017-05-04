function [x1List, x2List, y1List, y2List] = houghlines(im , h, thresh )
% HOUGHLINES
%
% Function takes an image and its Hough transform , finds the
% significant lines and draws them over the image
%
% Usage : houghlines (im , h, thresh )
%
% arguments :
% im - The original image
% h - Its Hough Transform
% thresh - The threshold level to use in the Hough Transform
% to decide whether an edge is significant

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
x1List= zeros(1,nregions); 
y1List = zeros(1,nregions); 
x2List = zeros(1,nregions); 
y2List = zeros(1,nregions); 
lines = zeros(3,nregions; 

for n = 1 : nregions
    mask = bwl == n; % Form a mask for each region .
    
    region = mask.* h; % Point - wise multiply mask by Hough Transform
    % to give you an image with just one region of
    % the Hough Transform .
    [rhoIdx, thetaIdx] = find(region == max(max(region))); 
%     rhoList(n) = rhos(rhoIdx); 
%     thetaList(n) = thetas(thetaIdx); 
    [x1, y1, x2, y2] = thetaRho2endpoints(thetas(thetaIdx), rhos(rhoIdx), rowsI, colsI); 
    x1List(n) = x1; 
    y1List(n) = y1; 
    x2List(n) = x2; 
    y2List(n) = y2; 
    lines(:,n) = cross([x1,y1,1], [x2,y2,1]);
    
end

figure;
imshow(im)

for i = 1 : nregions
   hold on
   plot([x1List(i), x2List(i)],[y1List(i), y2List(i)])
    
end

end