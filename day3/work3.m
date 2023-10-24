clc
clear
syms x
X=[0.40 0.55 0.65 0.80 0.90 1.05];
Y=[0.41075 0.57815 0.69675 0.88811 1.02652 1.25382];
y=Y(1);
%非调用自定义函数法
n=length(X);
A=[X',Y',zeros(n,n-1)];%l=n+1,h=n
for l=3:n+1 %列
    for h=l-1:n %行
        A(h,l)=(A(h,l-1)-A(h-1,l-1))/(X(h)-X(h-l+2));
    end
end
disp(A);%均差表
%调用自定义函数法
%A=newtonmatrix(X,Y);%均差表
%代入求函数表达式
for h=2:length(X)
    y=y+A(h,h+1)*prod(x-X(1:h-1));
end
y=collect(y,x);%合并化简
disp(y);
%绘图
fplot(y,[0.35 1.10]);
hold on
plot(X,Y,'ro');
legend({'Newton法图像','插值节点'});