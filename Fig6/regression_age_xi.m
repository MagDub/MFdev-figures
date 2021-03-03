
%function [] = regression_age_xi()

% Load data

load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/xi_mean.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/age.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/conners.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/part_num.mat')

% Variables

x1 = age;
x2 = conners;    
z  = xi_mean;

X = [ones(size(x1)) x1 x2 x1.*x2];
[b,bint,r,rint,stats] = regress(z,X);    

scatter3(x1,x2,z,'filled')
hold on
x1fit = min(x1):0.5:max(x1);
x2fit = min(x2):2:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Age')
ylabel('ADHD score')
zlabel('Value-free random exploration')
view(50,10)
hold off

% stats = R^2, F, p, estimate of error variance
res_stats.R2 = stats(1); % R^2
res_stats.F = stats(2);  % F-statistic 
res_stats.p = stats(3); % p-value, if <.05, a significant linear regression relationship exists ...
                    % between the response y and the predictor variables in X
res_stats.est = stats(4);   % estimate of the error variance           

%end
