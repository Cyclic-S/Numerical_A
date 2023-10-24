clc
clear
a=[0.25, 0.3, 0.39, 0.45, 0.53, 0.66, 0.72];
B=[0.5, 0.5477, 0.6245, 0.6708, 0.7280, 1.0254, 0.9521]';
syms x
y=0;
A=vander(a);
X=A\B;
for i=1:length(X')
    y=y+X(length(X')+1-i)*x^(i-1);
end
y=collect(y,x);%合并x项
disp(y);
fplot(y,[min(a) max(a)]);
hold on
plot(a,B,'ro');
legend({'直接法','插值节点'});