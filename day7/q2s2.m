syms x t;
a=0;
b=1;
f=2*x^4-3*x^3+2*x-1;
x1=(b-a)/2*t+(b+a)/2;
f1=subs(f,x1);
S=0;
for n=0:2
    S=(2*n+1)/2*int(f1*legendremap(n),-1,1)*legendremap(n)+S;
end
t=(2*x-a-b)/(b-a);
S=subs(S,t);
fplot(S,[a b]);
hold on
fplot(f,[a b]);
legend({'$S_2(x)$','$f(x)$'},'Interpreter','latex');