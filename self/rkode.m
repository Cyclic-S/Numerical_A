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
for i=1:n
    K1=f(X(i),Y(i));
    K2=f(X(i)+h/2,Y(i)+h/2*K1);
    K3=f(X(i)+h/2,Y(i)+h/2*K2);
    K4=f(X(i)+h,Y(i)+h*K3);
    Y(i+1)=Y(i)+h/6*(K1+2*K2+2*K3+K4); 
end
Y1=sqrt(X.^2+5);
plot(X,Y,'r-*')
hold on
plot(X,Y1,'b-')