clc
clear
syms x
f=1/(1+25*x^2);
N=[3 6 10];
S=[x x x];
for i=1:3
    s=0;
    for j=0:N(i)
        s=s+int(legendremap(j)*f,-1,1)*legendremap(j)*(2*j+1)/2;%自定义函数legendremap第七周作业
    end
    S(i)=collect(s,x);
    latex(S(i))
    fplot(S(i),[-1,1]);
    hold on
end
hold on
fplot(f,[-1 1]);
legend({'$S_3^*$','$S_6^*$','$S_{10}^*$','$f(x)$'},'Interpreter','latex');