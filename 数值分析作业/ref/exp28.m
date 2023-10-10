% ����������ֵ: f(x) = 1/(1+x^2)
% x �� [a, b]
% n: �������
% ��һ��߽�����: S'(x0) = f'0, S'(xn) = f'n
%
clear
clc
n = 10;
a = -5;
b = 5;
x = a:(b-a)/n:b;
h = x(2:end) - x(1:end-1);

% �����ڵ㺯��ֵ yj = f(xj)
y = 1./(1+x.^2);
%
% �߽�����
f0_der = -5*(-2)/(1+(-5)*(-5))^2;
fn_der = 5*(-2)/(1+5*5)^2;
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
% ÿ��С�����ڲ�ȡ�����㣨Ϊ��ͼ�Ƚϣ�
NumInInt = 50;
%
%���е��������λ��
totalNum = n*NumInInt + 1;
xx = linspace(a,b,totalNum);
%
% ���е㣨�ڵ�������ڲ��㣩�ϵ�����������ֵ����ֵ
S = zeros(1,totalNum);
%
% �ڵ��ϵ���������ֵ��ֵ����ֵ������
S(1:50:end) = y;
%
% ÿ�������ڲ����ϵ���������ֵ����
for j = 1: n
    index = (j-1)*NumInInt+2:j*NumInInt;
    x_int = xx(index);
    S(index) = M(j)*(x(j+1)-x_int).^3/(6*h(j)) + M(j+1)*(x_int-x(j)).^3/(6*h(j)) ...
        + (y(j)-1/6*M(j)*h(j)^2)*(x(j+1)-x_int)/h(j) + (y(j+1)-1/6*M(j+1)*h(j)^2)*(x_int-x(j))/h(j);
end
%
% ���е㣨�ڵ�������ڲ��㣩�ϵĺ���ֵ
yy = 1./(1+xx.^2);
plot(xx,S,'-b',xx,yy,'--r')
legend('����������ֵ','f(x)=1/(1+x^2)','LOCATION','South')
xlabel('x')
