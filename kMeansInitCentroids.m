function centroids = kMeansInitCentroids(X, K,rand_idx)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

centroids = zeros(K, size(X, 2));

% Set centroids to randomly chosen examples from the dataset X
centroids = X(rand_idx(1 : K) ,:);




end
