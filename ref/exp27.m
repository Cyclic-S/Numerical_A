% 三次样条插值
clear
clc
%
x = [27.7, 28, 29, 30];
y = [4.1, 4.3, 4.1, 3.0];
n = length(x) - 1;
h = x(2:end) - x(1:end-1);
%
% 边界条件
f0_der = 3.0;
fn_der = -4.0;
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
% 计算S(x)系数
c = zeros(n,4); 
for j = 1 : n
    c(j,1) = M(j)/(6*h(j));
    c(j,2) = M(j+1)/(6*h(j));
    c(j,3) = (y(j) - M(j)*h(j)*h(j)/6) / h(j);
    c(j,4) = (y(j+1) - M(j+1)*h(j)*h(j)/6) / h(j);
end
% 输出三次样条函数的系数
fprintf('标准形式的结果(系数): \n'); 
disp(c)
% 调用Matlab的三次样条插值函数
pp = spline(x, [f0_der, y, fn_der]);
fprintf('函数spline的结果(系数): \n'); 
disp(pp.coefs);

