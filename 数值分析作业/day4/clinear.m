% Runge函数的分段线性插值
%
clc
clear;
f = @(x) 1./(1+x.^2);
a = -5;
b = 5;
% 区间数
n = 10;
h = (b-a)/n;
% 插值节点、函数值、导数值
X = a:h:b;
Y = f(X);
% 每段区间取点用于计算函数值、画图
m = 20;
% 总点数及位置
nt = m*n+1;
x = a: h/m: b;
% 准确函数值
y = f(x);
% 分段线性插值
L1 = zeros(1,nt);
for k = 1:n
    % 每段上所取点的索引
    temp = (k-1)*m+1:k*m+1;
    % 分段线性插值
    L1(temp) = Y(k)*(x(temp)-X(k+1))/(X(k)-X(k+1)) ...
             + Y(k+1)*(x(temp)-X(k))/(X(k+1)-X(k));
end
plot(x,y,'--k',x,L1,'-r');
legend('1/(1+x^2)','分段线性插值')
xlabel('x')
title('Runge函数的分段插值')