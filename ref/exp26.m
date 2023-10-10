% Runge�����ķֶ����Բ�ֵ�ͷֶ�����Hermite��ֵ
%
clc
clear;
f = @(x) 1./(1+x.^2);
fx = @(x) -2*x./(1+x.^2).^2;
a = -5;
b = 5;
% ������
n = 10;
h = (b-a)/n;
% ��ֵ�ڵ㡢����ֵ������ֵ
X = a:h:b;
Y = f(X);
Z = fx(X);
% ÿ������ȡ�����ڼ��㺯��ֵ����ͼ
m = 20;
% �ܵ�����λ��
nt = m*n+1;
x = a: h/m: b;
% ׼ȷ����ֵ
y = f(x);
% �ֶ����Բ�ֵ
L1 = zeros(1,nt);
% �ֶ�����Hermite��ֵ
H3 = zeros(1,nt);
for k = 1:n
    % ÿ������ȡ�������
    temp = (k-1)*m+1:k*m+1;
    % �ֶ����Բ�ֵ
    L1(temp) = Y(k)*(x(temp)-X(k+1))/(X(k)-X(k+1)) ...
             + Y(k+1)*(x(temp)-X(k))/(X(k+1)-X(k));
    % �ֶ�����Hermite��ֵ     
    H3(temp) = (1+2*(x(temp)-X(k))/(X(k+1)-X(k)))...
               .*((x(temp)-X(k+1))/(X(k)-X(k+1))).^2*Y(k) ...
             + (1+2*(x(temp)-X(k+1))/(X(k)-X(k+1)))...
               .*((x(temp)-X(k))/(X(k+1)-X(k))).^2*Y(k+1) ...
             + (x(temp)-X(k)).*((x(temp)-X(k+1))/(X(k)-X(k+1))).^2*Z(k)...
             + (x(temp)-X(k+1)).*((x(temp)-X(k))/(X(k+1)-X(k))).^2*Z(k+1);
end
plot(x,y,'--k',x,L1,'-r',x,H3,'-b');
legend('1/(1+x^2)','�ֶ����Բ�ֵ','�ֶ�����Hermite��ֵ')
xlabel('x')
title('Runge�����ķֶβ�ֵ')
