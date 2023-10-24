clc
clear
X=[0.25, 0.3, 0.39, 0.45, 0.53, 0.66, 0.72];
Y=[0.5, 0.5477, 0.6245, 0.6708, 0.7280, 1.0254, 0.9521];
syms x
s1=0;
for i=1:length(X)
    t=1;
    for j=1:length(Y)
        if j~=i
           t=t*(x-X(j))/(X(i)-X(j));
        end
    end
    s1=s1+Y(i)*t;
end
y=collect(s1,x);%合并x项
disp(y);
fplot(y,[min(X) max(X)]);
hold on
plot(X,Y,'ro');
legend({'Lagrange插值法','插值节点'});