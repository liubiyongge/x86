%logister回归梯度下降法
clear all;
close all;
clc;
X = [19 18; 21 20; 22 21; 25 24; 30 25; 10 20; 15 30; 33 50; 10 15; 30 45; 40 60];%每一行为一个样本
y = [1 1 1 1 1 0 0 0 0 0 0]';

%样本处理
%x_mean = mean(X);
%x_max = max(X);
%x_min = min(X);
%X = (X - x_mean).*(x_max - x_min).^-1;

[m, n] = size(X);%获得样本数量
sample_num = m;
X = [ones(m, 1), X]; %X增加一维

%Plot the training data
figure;%画出数据集图
pos = find(y == 1);neg = find(y == 0);
plot(X(pos, 2), X(pos, 3), '+');%画出数据点
hold on;
plot(X(neg, 2), X(neg, 3), 'o');
hold on
xlabel('EXam 1 score')
ylabel('EXam 2 score')

itera_num = 1000;%设置迭代次数
g = inline('1.0./(1.0 + exp(-z))');%这个就相当于制造了一个function g（z）=1.0 ./ (1.0 + eXp(-z))
plotstyle = {'b', 'r', 'g', 'k', 'b--', 'r--'};
figure;%建立新窗口
alpha = [0.0009, 0.0011, 0.0012, 0.0013, 0.0014];%下面就分别用这几个学习速率看看哪个更好
for alpha_i = 1:length(alpha)
	theta = zeros(n+1, 1);
	J = zeros(itera_num, 1);%记录代价函数
	for i = 1:itera_num
		z = X * theta;
		h = g(z);
		J(i) = (1/sample_num).*sum(-y.*log(h) - (1 - y).*log(1 - h));
		grand = (1/sample_num).*X'*(h - y);
		theta = theta - alpha(alpha_i).*grand;
	end
	plot(0:itera_num-1, J(1:itera_num),char(plotstyle(alpha_i)), 'LineWidth', 2);
	hold on
end
legend('0.0009', '0.001','0.0011','0.0012','0.0013' ,'0.0014');%给每一个线段格式标注上
xlabel('Number of iterations');
ylabel('Cost function');
plot_X = [min(X(:,2))-2,  max(X(:,2))+2];
plot_y = (-1./theta(3)).*(theta(2).*plot_X +theta(1));
figure;
plot(X(pos, 2), X(pos, 3), '+');
hold on;
plot(X(neg, 2), X(neg, 3), 'o');
hold on;
plot(plot_X, plot_y);
legend('Admitted', 'Not admitted', 'Decision Boundary');
hold off;