clc
clear
format long
syms x y%变量声明
f0=x/y;%定义函数
f=matlabFunction(f0);
a=2;
b=5;
n=20;%取点个数
h=(b-a)/n;
X=a:h:b;
Y=zeros(1,length(X));
Y(1)=3;%初值
for i=2:length(Y)
   Y(i)=Y(i-1)+h*f(X(i-1),Y(i-1));
end
Y1=sqrt(X.^2+5);
plot(X,Y,'r-*')
hold on
plot(X,Y1,'b-')
