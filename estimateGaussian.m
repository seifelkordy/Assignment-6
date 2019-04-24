function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

[m, n] = size(X);

mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% Compute the mean of the data and the variances
% In particular, mu(i) contain the mean of
% the data for the i-th feature and sigma2(i)
% contain variance of the i-th feature.
%

mu = mean(X)';
sigma2 = var(X)';



end