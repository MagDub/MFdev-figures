
%function [] = regression_age_xi()

% Load data

load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/xi_mean.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/age.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/conners.mat')
load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/part_num.mat')

part_num = part_num';

% age groups
idx_group1 = find(part_num(1,:)<200);
idx_group2 = [find(part_num(1,:)==201) : (find(part_num(1,:)==301)-1)];
idx_group3 = [find(part_num(1,:)==301) : size(part_num,2)];
ageGroup = age;
ageGroup(idx_group1,:) = 1;
ageGroup(idx_group2,:) = 2;
ageGroup(idx_group3,:) = 3;

% Variables

x1 = ageGroup;
x2 = conners;    
z  = xi_mean;

X = [ones(size(x1)) x1 x2 x1.*x2];
[b,bint,r,rint,stats] = regress(z,X);    

scatter3(x1,x2,z,'filled')
hold on
x1fit = min(x1):1:max(x1);
x2fit = min(x2):5:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Age')
ylabel('ADHD score')
zlabel('Value-free random exploration')
view(50,10)
hold off


%end
