%% Initialization
clear ; close all; clc

%% ================== Part 1: Load Example Dataset  ===================

fprintf('Visualizing example dataset for outlier detection.\n\n');

%  The following command loads the dataset. You should now have the
%  variables X, Xval, yval in your environment
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

m=floor(0.7 * length(T{:,1}));
n=floor(0 * length(T{:,1}));

%%%%%% training set%%%%%%%
X_train=T{1:m,3:21};

Y_train=T{1:m,3};

% Normalization feature
%%% cross validation set

%%% test set
X_test=T{m+n+1:end,3:21};

Y_test=T{m+n+1:end,3};


%  Visualize the example dataset
plot(X_train(:, 1), X_train(:, 2), 'bx');
axis([0 30 0 30]);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');

%% ================== Part 2: Estimate the dataset statistics ===================
%  For this exercise, assume a Gaussian distribution for the dataset.
%
%  first estimate the parameters of our assumed Gaussian distribution, 
%  then compute the probabilities for each of the points and then visualize 
%  both the overall distribution and where each of the points falls in 
%  terms of that distribution.
%
fprintf('Visualizing Gaussian fit.\n\n');

%  Estimate mu and sigma2
[mu sigma2] = estimateGaussian(X_train);

y=[];
epsilon = 10^-45;

for i= 1:size(X_test,1)

k = length(mu);
Sigma2 = diag(sigma2);
X = X_test(i,:)- mu';
p = 1/(sqrt(2 * pi)^k) * 1/sqrt(det(Sigma2)) * ...
    exp(-0.5 * sum(X.^2/sigma2'));

y = [y (p<epsilon)];
% if p < epsilon || p>1-epsilon
%    y = [y 1];
% else
%    y = [y 0];
% end
 end
t = y(y==1);