clc
clear
format long
%变量声明
syms x
f0=sin(x);
f=matlabFunction(f0)
%取点
a=0;
b=1;
n=100;
h=(b-a)/n;
%代入函数
X=a:h:b;
Y=f(X);
%复合梯形求积公式
I_Trap=h*((f(a)+f(b))/2+sum(Y(1:n-1)))




