% 三次样条插值: f(x) = 1/(1+x^2)
% x 在 [a, b]
% n: 区间个数
% 第一类边界条件: S'(x0) = f'0, S'(xn) = f'n
%
clear
clc
n = 10;
a = -5;
b = 5;
x = a:(b-a)/n:b;
h = x(2:end) - x(1:end-1);

% 给定节点函数值 yj = f(xj)
y = 1./(1+x.^2);
%
% 边界条件
f0_der = -5*(-2)/(1+(-5)*(-5))^2;
fn_der = 5*(-2)/(1+5*5)^2;
%
% 一阶均差(为计算d)
FirstDiff = (y(2:end) - y(1:end-1))./h;
% 二阶均差(为计算d)
SecondDiff = (FirstDiff(2:end) - FirstDiff(1:end-1))./(h(1:end-1) + h(2:end));
%
% 向量mu, lambda
mu = h(1:end-1)./(h(1:end-1) + h(2:end));
mu = [mu 1];
lambda = h(2:end)./(h(1:end-1) + h(2:end));
lambda = [1 lambda];

% 右端向量d
d = zeros(n+1,1);
d(1) = 6/h(1)*(FirstDiff(1) - f0_der);
d(2:end-1) = 6*SecondDiff';
d(end) = 6/h(end)*(fn_der - FirstDiff(end));
%
% 三对角系数矩阵
A = diag(2*ones(n+1,1)) + diag(lambda,1) + diag(mu,-1);
%
% 解三弯矩方程组
M = A\d;
%
% 每个小区间内部取几个点（为画图比较）
NumInInt = 50;
%
%所有点个数及点位置
totalNum = n*NumInInt + 1;
xx = linspace(a,b,totalNum);
%
% 所有点（节点和区间内部点）上的三次样条插值函数值
S = zeros(1,totalNum);
%
% 节点上的样条函数值赋值（插值条件）
S(1:50:end) = y;
%
% 每个区间内部点上的样条函数值计算
for j = 1: n
    index = (j-1)*NumInInt+2:j*NumInInt;
    x_int = xx(index);
    S(index) = M(j)*(x(j+1)-x_int).^3/(6*h(j)) + M(j+1)*(x_int-x(j)).^3/(6*h(j)) ...
        + (y(j)-1/6*M(j)*h(j)^2)*(x(j+1)-x_int)/h(j) + (y(j+1)-1/6*M(j+1)*h(j)^2)*(x_int-x(j))/h(j);
end
%
% 所有点（节点和区间内部点）上的函数值
yy = 1./(1+xx.^2);
plot(xx,S,'-b',xx,yy,'--r')
legend('三次样条插值','f(x)=1/(1+x^2)','LOCATION','South')
xlabel('x')
