clc
clear
format long
syms x%变量声明
f0=sin(x);%函数
f=matlabFunction(f0)
%%取点
a=0;
b=1;
n=100;
h=(b-a)/n;
%%代入
X=a:h:b;
Y=f(X);
%复合Simpson求积公式(hint:隔点取区间)
I_Simp=(h/3)*(sum(Y(1:length(Y)))+3*sum(Y(2:2:n))+sum(Y(3:2:n-1)))