x = -8:0.5:8;
y = x';
X = ones(size(y)) * x;
Y = y * ones(size(x));
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
surf(X,Y,Z)
colormap(cool);
xlabel('x'), ylabel('y'), zlabel('x');

