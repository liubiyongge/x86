%多变量
%数据x用矩阵输入，y用列向量输入
clear all;
clc;
%training sample data
P = [6, 7, 2];

x=[7 9 12 5 4; 1 8 21 3 5];

y = [57 85 132 47 44]';
%begin
x_mean = mean(x')';%mean对每一列求平均
x_max = max(x')';%对每一列求最大
x_min = min(x')';
x = (x - x_mean).*(x_max - x_min).^-1;
num_sample=size(x,2);%size得到矩阵行列 
X(1:num_sample) =  1;%设置每行首元为1
X = [X', x'];%系数矩阵
%gradient descending process
%initial values of parameters
theta = [73 55 40]';%
%learning rate
alpha = 0.001;
% if alpha is too large, the final error will be much large.

% if alpha is too small, the convergence will be slow
epoch = 1000000;
for k = 1:epoch
    Y = X * theta;%获得Y
    Jcost(k)=sum((Y - y).^2)/(2 * num_sample);%列向量有点乘  
    theta = theta - alpha * (X' * (Y - y))/num_sample;
end
plot(Jcost);
num_theta = size(theta, 1);
theta1(2:num_theta) = theta(2:num_theta) .* (x_max - x_min).^-1;
theta1(1) = theta(1) - sum(theta1(2:num_theta)'.*(x_mean));
theta1 = theta1';

    
    
