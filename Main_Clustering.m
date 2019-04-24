clc
clear
close all

excel = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
     'MissingValue',0,'ReadSize',17999);
T = read(excel);
alpha=.0001;

for i= 1:19
    if iscell(T.(i))
       T.(i)= str2double(T.(i));
    end
end

m=floor(length(T{:,1}));
n=floor(length(T{:,1}));

%%%%%% training set%%%%%%%
X=T{1:m,3:21};
Y = T{1:m,3};

max_iters = 10;

[X_norm, mu, sigma] = featureNormalize(X);

[U, S] = pca(X_norm);

eigenValues = diag(S);

lamda_m = sum(eigenValues);

alpha_threshold = 0.001;

for k = 1:length(eigenValues)
    lamda_k = sum(eigenValues(1:k,1));
    alpha = 1-(lamda_k/lamda_m);
    if alpha<=alpha_threshold
       break;
    end
end

Z = projectData(X_norm, U, k);


M1 = [];
M2 =[];
for k = 1:10
        rand_idx = randperm(size(X , 1));

        initial_centroids = kMeansInitCentroids(X, k,rand_idx);
        
        [centroids1,Max, idx] = runkMeans(X, initial_centroids, max_iters);
                
        M1 = [M1 Max];
        
        %initial_centroids = kMeansInitCentroids(Z, k,rand_idx);
        
        %[centroids2,Max, idx] = runkMeans(Z, initial_centroids, max_iters);
                
        %M2 = [M2 Max];

end


[~,k1] = min(M1);
%[~,k2] = min(M2);

numberOFClusters = 1:10;
plot(numberOFClusters, M1);

%initial_centroids = kMeansInitCentroids(X, k);
%[centroids1,Max, idx] = runkMeans(X, initial_centroids, max_iters);
%[centroids2,Max, idx] = runkMeans(Z, initial_centroids, max_iters);
