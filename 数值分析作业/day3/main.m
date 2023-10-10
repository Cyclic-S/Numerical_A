clc
clear
syms x
X=[0.40 0.55 0.65 0.80 0.90 1.05];
Y=[0.41075 0.57815 0.69675 0.88811 1.02652 1.25382];
y=Y(1);
A=newtonmatrix(X,Y);%均差表
for h=2:length(X)
    y=y+A(h,h+1)*prod(x-X(1:h-1));
end
y=collect(y,x)%合并化简
T=0.35:0.01:1.10;
f=matlabFunction(y);
plot(T,f(T));
hold on
plot(X,Y,'ro');