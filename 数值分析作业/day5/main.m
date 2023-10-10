syms x
f=cos(2*pi*x);
N=[3 5 7 9 10];
X=0:0.01:1;
f1=matlabFunction(f);
plot(X,f1(X));
hold on
for n=1:5
    y=bernstein_n(f,N(n));
    disp(y);
    fy=matlabFunction(y);
    plot(X,fy(X));
    hold on
end
legend('f','n=3','n=5','n=7','n=9','n=10');
