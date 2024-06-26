clc;clear;
syms x t
a=0;b=1;
f=2*x^4-3*x^3+2*x-1;f1=matlabFunction(f);
%求解Berstein多项式
Y=[x x x];%初始化定义Berstein多项式
for i=1:3
    y=0;
    for k=0:1:i
        B_in=nchoosek(i,k)*x^k*(1-x)^(i-k);%Bernstein基底(第六周作业)
        y=y+f1(k/i)*B_in;
        Y(i)=collect(y);
    end
    latex(Y(i))
    fplot(Y,[a b]);
end
hold on;fplot(f,[a b]);
%求解三次最佳一致逼近多项式P_3(x)=f(x)-a_n*T'_4(x)
T_4=(8*t^4-8*t^2+1)/(2^3);%首一
x1=((b-a)*t+a+b)/2;
f2=collect(subs(f,x1),t);%t\in [-1,1]
c=coeffs(f2);
P_3=f2-c(end)*T_4;
t=(2*x-a-b)/(b-a);P=subs(P_3,t);latex(P)
hold on;fplot(P,[a b]);
legend({'$B_1(f,x)$','$B_2(f,x)$','$B_3(f,x)$','$f(x)$','$P_3^*(x)$'},'Interpreter','latex');




