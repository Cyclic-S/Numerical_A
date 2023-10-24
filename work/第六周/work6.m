syms x
f=cos(2*pi*x);
N=[3 5 7 9 10];
fplot(f,[0 1]);
hold on
for n=1:5
    y=bernstein_n(f,N(n));%此处调用自定义函数
    disp(y);
    fplot(y,[0 1]);
    hold on
end
legend('$f$','$B_3(f,x)$','$B_5(f,x)$','$B_7(f,x)$','$B_9(f,x)$','$B_{10}(f,x)$','Interpreter','latex');