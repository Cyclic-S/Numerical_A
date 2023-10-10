x=[0.2 0.4 0.6 0.8 1.0];
y=[0.98 0.92 0.81 0.64 0.38];
y0=0;          %  S''(x0)=f''(x0)=y0   
yn=0;          %  S''(xn)=f''(xn)=yn
x0=0.2:0.01:1;
s=threesimple2(x,y,x0,y0,yn)
plot(x0,s)        %绘制第二边界条件插值函数图像
hold on
grid on
plot(x,y,'o')
xlabel('自变量 X'), ylabel('因变量 Y')
title('插值点与三次样条函数') 
legend('三次样条插值点坐标','插值点')
