%% 三点三次Hermite插值方式
clc
clear
syms x a
X=[1.9321 2.2201 2.5281];%选择的插值节点
Y=sqrt(X);%Y=[1.39 1.49 1.59]
i=2;
DY_i=subs(diff(sqrt(x),1),x,X(i));
n=length(X);
y=Y(1);
A=[X',Y',zeros(n,n-1)];%均差表(l=n+1,h=n)
for l=3:n+1 %列
    for h=l-1:n %行
        A(h,l)=(A(h,l-1)-A(h-1,l-1))/(X(h)-X(h-l+2));
    end
end
for h=2:length(X)
    y=y+A(h,h+1)*prod(x-X(1:h-1));%前n-1项
end
y1=y+a*prod(x-X(1:n));
a1=solve(diff(y1,x)==DY_i,a);%符号运算求解
a2=subs(a1,x,X(i));%代值已知f'(x_i)求a
y2=y+a2*prod(x-X(1:n));
y=collect(y2,x);%化简
X2=[2 2.2 2.5];%估计点值
y3=vpa(subs(y,x,X2),5);
disp(y3);%估计点函数值
%绘图
plot(X,Y,'ro');
hold on
fplot(y,[min(X) max(X)]);
legend({'插值节点','三点三次Hermite插值'});