%page50ex1
clc
clear
syms x
X=[0.2 0.4 0.6 0.8 1.0];
Y=[0.98 0.92 0.81 0.64 0.38];
y=Y(1);
A=newtonmatrix(X,Y);%均差表
for h=2:length(X)
    y=y+A(h,h+1)*prod(x-X(1:h-1));
end
y=collect(y,x)%合并化简
W=[0.2 0.28 1.08 1.00]
T=min([X,W]):0.01:max([X,W]);
f=matlabFunction(y);
plot(T,f(T));
hold on
plot(W,f(W),'ro');