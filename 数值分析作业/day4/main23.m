%% 两点三次Hermite插值方式
clc
clear
syms x
X=[1.9321 2.5281];
Y=sqrt(X);%Y=[1.39 1.59]
DY_all=subs(diff(sqrt(x),1),x,X);
y=hermite23(X,Y,DY_all)
X2=[2 2.2 2.5];%估计点值
y2=vpa(subs(y,x,X2),5)
% plot(X,Y,'ro');
% hold on
% t=min(X):0.01:max(X);
% f=matlabFunction(y);
% plot(t,f(t));