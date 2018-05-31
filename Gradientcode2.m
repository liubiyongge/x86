%单变量
%数据x用矩阵输入，y用列向量输入
clear all;
clc;
%training sample data
p0 = 3;
p1 = 7;
x = 1:3;
y = p0 + p1 * x';
%begin
num_sample=size(x,2);%size得到矩阵行列 
X(1:num_sample) =  1;%设置每行首元为1
X = [X', x'];%系数矩阵
%gradient descending process
%initial values of parameters
theta = [1 3]';%
%learning rate
alpha = 0.02;
% if alpha is too large, the final error will be much large.

% if alpha is too small, the convergence will be slow
epoch = 500;
for k = 1:epoch
    Y = X * theta;%获得Y
    Jcost(k)=sum((Y - y).^2)/(2 * num_sample);%列向量有点乘  
    theta = theta - alpha * (X' * (Y - y))/num_sample;
end
plot(Jcost);
    
    
