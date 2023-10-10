% ����������ֵ
clear
clc
%
x = [27.7, 28, 29, 30];
y = [4.1, 4.3, 4.1, 3.0];
n = length(x) - 1;
h = x(2:end) - x(1:end-1);
%
% �߽�����
f0_der = 3.0;
fn_der = -4.0;
%
% һ�׾���(Ϊ����d)
FirstDiff = (y(2:end) - y(1:end-1))./h;
% ���׾���(Ϊ����d)
SecondDiff = (FirstDiff(2:end) - FirstDiff(1:end-1))./(h(1:end-1) + h(2:end));
%
% ����mu, lambda
mu = h(1:end-1)./(h(1:end-1) + h(2:end));
mu = [mu 1];
lambda = h(2:end)./(h(1:end-1) + h(2:end));
lambda = [1 lambda];

% �Ҷ�����d
d = zeros(n+1,1);
d(1) = 6/h(1)*(FirstDiff(1) - f0_der);
d(2:end-1) = 6*SecondDiff';
d(end) = 6/h(end)*(fn_der - FirstDiff(end));
%
% ���Խ�ϵ������
A = diag(2*ones(n+1,1)) + diag(lambda,1) + diag(mu,-1);
%
% ������ط�����
M = A\d;
%
% ����S(x)ϵ��
c = zeros(n,4); 
for j = 1 : n
    c(j,1) = M(j)/(6*h(j));
    c(j,2) = M(j+1)/(6*h(j));
    c(j,3) = (y(j) - M(j)*h(j)*h(j)/6) / h(j);
    c(j,4) = (y(j+1) - M(j+1)*h(j)*h(j)/6) / h(j);
end
% �����������������ϵ��
fprintf('��׼��ʽ�Ľ��(ϵ��): \n'); 
disp(c)
% ����Matlab������������ֵ����
pp = spline(x, [f0_der, y, fn_der]);
fprintf('����spline�Ľ��(ϵ��): \n'); 
disp(pp.coefs);

