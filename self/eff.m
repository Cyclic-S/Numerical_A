clear
clc
format long
syms x%变量声明
f0=x*exp(x)-1;%定义函数
f=matlabFunction(f0);
%%区间长度
a=0;
b=1;
int_num=0;%迭代次数初值
eps=1;%精度初值
%%main
while eps>10^(-8)
    x_half=(a+b)/2;
    if x_half==0
        x_result=x_half;
    end
    if f(a)*f(x_half)<0
        b=x_half;
    end
    if f(a)*f(x_half)>0
        a=x_half;
    end
    eps=abs(b-a);
    int_num=int_num+1;
end
x_result=x_half
    