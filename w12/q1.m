%% 复合梯形求积公式
clc
clear
syms x
y=x^5*exp(-x)*sin(x);
f=matlabFunction(y);
N=[4 8 16 32 64];
I=zeros(1,length(N));%积分结果
a=0;b=5;
for n=1:length(N)
    h=(b-a)/N(n);
    X=a:h:b;
    Y=f(X);
    I(n)=(2*sum(Y)-Y(1)-Y(length(X)))*h/2;
end
%% 复合Simpson公式
clc
clear
syms x
y=x^5*exp(-x)*sin(x);
f=matlabFunction(y);
N=[4 8 16 32 64];
I=zeros(1,length(N));%积分结果
a=0;b=5;
for n=1:length(N)
    h=(b-a)/N(n);
    X=a:h:b;
    Y=f(X);
    Z=zeros(1,length(X)-1);
    for i=1:length(Z)
        Z(i)=X(i)+h/2;
    end
    D=f(Z);
    I(n)=(4*sum(D)+2*sum(Y)-Y(1)-Y(length(X)))*h/6;
end