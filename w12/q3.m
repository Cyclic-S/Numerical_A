%% 复合高斯-勒让德求积公式
clc
clear
syms x t
y=x^5*exp(-x)*sin(x);
a=0;b=5;
XK=[0.7745967 -0.7745967 0];
A=[0.5555556 0.5555556 0.8888889];
N=[5 10];
Result=zeros(1,length(N));
for n=1:length(N)
    h=(b-a)/N(n);
    X=a:h:b;
    I=zeros(1,length(X)-1);%小区间上的积分值
    for i=1:length(I)%小区间G-L
        x=h*t/2+(X(i+1)+X(i))/2;
        y1=subs(y,x);
        f=matlabFunction(y1);
        I(i)=A*f(XK)'*h/2;
    end
    Result(n)=sum(I);
end