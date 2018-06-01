%关系运用之一：求近似极限，修补图形缺口
t = -2*pi:pi/10:2*pi;
y = sin(t)./t;
tt = t + (t==0) * eps;
yy = sin(tt)./tt;
subplot(1,2,1), plot(t, y), axis([-7, 7, -0.5, 1.2]),
xlabel('t'),ylabel('y'),title('残缺图像')
subplot(1,2,2), plot(tt, yy), axis([-7, 7, -0.5, 1.2]),
xlabel('t'),ylabel('yy'),title('正确图像')
