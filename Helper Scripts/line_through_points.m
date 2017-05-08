function l = line_through_points ( points )
% returns :
% l - homogeneous representation of the least -square -fit

%calculate the centroid of the point
cx = mean(points(1,:));
cy = mean(points(2,:));

c = [cx; cy; 1];

%
pointsStar = points - c; 

%get the covariance matrix
C = cov(pointsStar); 

%get the eigenvector D of the largest eigenvalue V of the covariance matrix 
[V, D]= eig(C); 

%find the maximal eigVal
[~, idxMaxEigVal] = find(max(max(V))); 


%get the eigenvector of the maximal eigVal
eigVec = D(:,idxMaxEigVal); 

%the optimal line passes trough c with direction eigVec
l = eigVec;

end