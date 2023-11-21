%% 高斯-勒让德求积公式
clc
clear
syms x t
y=x^5*exp(-x)*sin(x);
a=0;b=5;
x=(b-a)*t/2+(a+b)/2;
y1=subs(y,x);%区间变换
f=matlabFunction(y1);
%求解t_k
P_6=(231*t^6-315*t^4+105*t^2-5)/16;
T=vpa(solve(P_6==0));
Y=f(T);
A=[0.4679139 0.3607616 0.1713245 0.4679139 0.3607616 0.1713245];
I=A*Y*(b-a)/2;
