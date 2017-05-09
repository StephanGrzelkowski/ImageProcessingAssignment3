function l = line_through_points ( points )
% returns :
% l - homogeneous representation of the least -square -fit

%calculate the centroid of the point
cx = mean(points(1,:));
cy = mean(points(2,:));

c = [cx; cy];

%
pointsStar = points(1:2,:) - c; 

%get the covariance matrix
C = cov(pointsStar'); 

%get the eigenvector D of the largest eigenvalue V of the covariance matrix 
[V, D]= eig(C); 

%find the maximal eigVal
[~, idxMaxEigVal] = find(max(max(D))); 


%get the eigenvector of the maximal eigVal
eigVec = V(:,idxMaxEigVal); 

%the optimal line passes trough c with direction eigVec
cstar = [cx + eigVec(1); cy + eigVec(2); 1]; 
c(3) = 1;

l = cross(c, cstar)'; 


end