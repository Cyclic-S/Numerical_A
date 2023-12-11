clear
clc
format long
syms x%变量声明
f0=x*exp(x)-1;%定义函数
f1=diff(f0,1);%函数的一阶导数
f=matlabFunction(f0);
df=matlabFunction(f1);
x0=0.5;%初值
eps=1;%精度初值
%%newton迭代
while eps>10^(-8)
    x1=x0-f(x0)/df(x0);
    x0=x1;
    eps=abs(x1-x0);
end
x_result=x1