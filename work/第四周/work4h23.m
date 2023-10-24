%% 两点三次Hermite插值方式
clc
clear
syms x
X=[1.9321 2.5281];%选择的插值节点
Y=sqrt(X);%Y=[1.39 1.59]
DY_all=subs(diff(sqrt(x),1),x,X);
syms x
y=(1+2*(x-X(1))/(X(2)-X(1)))*((x-X(2))/(X(1)-X(2)))^2*Y(1)+...
  (1+2*(x-X(2))/(X(1)-X(2)))*((x-X(1))/(X(2)-X(1)))^2*Y(2)+...
  (x-X(1))*((x-X(2))/(X(1)-X(2)))^2*DY_all(1)+...
  (x-X(2))*((x-X(1))/(X(2)-X(1)))^2*DY_all(2);
y=collect(y);
X2=[2 2.2 2.5];%估计点值
y2=vpa(subs(y,x,X2),5);
disp(y2);%估计函数值
%绘图
plot(X,Y,'ro');
hold on
fplot(y,[min(X) max(X)]);
legend({'插值节点','两点三次Hermite插值'});