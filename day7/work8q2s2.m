clc
clear
syms x t;
a=0;
b=1;
f=2*x^4-3*x^3+2*x-1;
x1=(b-a)/2*t+(b+a)/2;
f1=subs(f,x1);
S=0;
%直接定义Legendre多项式
L=[1 t (3*t^2-1)/2 (5*t^3-3*t)/2];
for n=0:2
    S=(2*n+1)/2*int(f1*L(n+1),-1,1)*L(n+1)+S;
end
% 递推函数法求Legendre多项式
% for n=0:2
%     S=(2*n+1)/2*int(f1*legendremap(n),-1,1)*legendremap(n)+S;
% end
t=(2*x-a-b)/(b-a);
S=subs(S,t);
S=collect(S,x);
latex(S)
fplot(S,[a b]);
hold on
fplot(f,[a b]);
legend({'$S_2(x)$','$f(x)$'},'Interpreter','latex');