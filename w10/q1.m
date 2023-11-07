%% Lagrange方法
clc
clear
X=[-2 0 1 2];
Y=[-7 1 2 9];
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
f=matlabFunction(y);
Output=f(1.3);
disp(Output);
