clear all
x=[7 9 12 5 4; 1 8 21 3 5];
y = [57 85 132 47 44]';
num_sample=size(x,2);%size得到矩阵行列
X(1:num_sample) =  1;%设置每行首元为1
X = [X', x'];%系数矩阵
pinv(X'*X)*X'*y
