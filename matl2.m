%逻辑操作应用之一：逐段解析函数的计算和表现。本例演示削顶整流正弦半波的计算和图形绘制。
t = linspace(0, 3*pi, 500);
y = sin(t);
%处理方法1
z1 = ((t < pi) | (t > 2 * pi)) .* y;
w = (t > pi/3 & t < 2*pi/3) + (t > 7*pi/3 & t < 8*pi/3);
w_n = ~w;
z2 = w * sin(pi/3) + w_n.*z1;
subplot(1,3,1),plot(t,y,':r'),ylabel('y');
subplot(1,3,2),plot(t,z1,':r'),axis([0 10 -1 1]);
subplot(1,3,3),plot(t,z2,'-b'),axis([0 10 -1 1]);
%处理方法2
z = (y >= 0).* y
a = sin(pi/3);
z = (y >= a) * a + (y < a) .* z;
plot(t,y,':r');hold on;plot(t,z,'-b');
xlabel('t'),ylabel('z=f(t)'),title('逐段解析函数');
legend('y=sin(t)','z=f(t)'),hold off;