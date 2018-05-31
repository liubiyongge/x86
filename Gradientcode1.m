clear all;
clc;
%training sample data
p0 = 3;
p1 = 7;
x = 1:3;
y = p0 + p1*x;
num_sample=size(y,2);
%gradient descending process
%initial values of parameters
theta0 = 1;
theta1 = 3;
%learning rate
alpha = 0.02;
% if alpha is too large, the final error will be much large.

% if alpha is too small, the convergence will be slow
epoch = 500;
for k = 1:epoch
    v_k = k;
    h_theta_x=theta0+theta1*x;
    Jcost1(k) = 0;
    theta01 = 0;
    theta11 = 0;
    for i = 1:num_sample
        Jcost1(k) = (h_theta_x(i)-y(i))^2 + Jcost1(k);
        theta01 = (h_theta_x(i) - y(i)) + theta01;
        theta11 =(h_theta_x(i)-y(i))*x(i) + theta11;
    end
    Jcost(k) = Jcost1(k)/num_sample;
    theta0 = theta0 - alpha*theta01/num_sample;
    theta1 = theta1 - alpha*theta11/num_sample;
end
plot(Jcost);
    
    
