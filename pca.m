function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

[m, n] = size(X);

U = zeros(n);
S = zeros(n);

%  first  the covariance matrix is computed.Thenthe "svd" function is used to
% compute the eigenvectors and eigenvalues of the covariance matrix. 
% When computing the covariance matrix-----divide by m (the
%       number of examples).
%

Sigma = (1/m) * cov(X);

[U , S] = svd(Sigma);


end




