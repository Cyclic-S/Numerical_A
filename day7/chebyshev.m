clc
clear
syms x
f=1/(1+x^2);
f1=matlabFunction(f);
a=-5;
b=5;
N=[11 15 21];
X=zeros(length(N),max(N));
for i=1:length(N)-1
    Y=[x,x^(i)];
end
for i=1:length(N)
    for j=1:N(i)
        X(i,j)=(b-a)/2*cos((2*(j-1)+1)/(2*N(i))*pi)+(a+b)/2;
    end
end
for i=1:length(N)
    P=X(i,1:N(i));
    R=f1(P);
    %Y(i)=lagrangeslove(P,R);%第二周作业
    s1=0;
    for l=1:length(P)
        t=1;
        for j=1:length(R)
            if j~=l
                t=t*(x-P(j))/(P(l)-P(j));
            end
        end
        s1=s1+R(l)*t;
    end
    Y(i)=collect(s1,x);
    % 绘图
    %fplot(Y(i));%Lagrange插值多项式图像
    fplot(f-Y(i));%误差曲线
    hold on
end
%legend({'$L_{10}(x)$','$L_{14}(x)$','$L_{20}(x)$'},'Interpreter','latex');
legend({'$f(x)-L_{10}(x)$','$f(x)-L_{14}(x)$','$f(x)-L_{20}(x)$'},'Interpreter','latex');


