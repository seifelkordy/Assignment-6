function [M,idx] = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

K = size(centroids, 1);
idx = zeros(size(X,1), 1);

% I go over every example, find its closest centroid, and store
% the index inside idx at the appropriate location.
% Concretely, idx(i) contains the index of the centroid
% closest to example i. Hence, it should be a value in the 
% range 1..K


m = size(X  , 1);

for i = 1 : m,
	T = [];
	for j = 1 : K,
		T = [T ; X(i,:)];
	end
	[M , idx(i)] = min(sum((T - centroids).^2 , 2));
end
		
		

end