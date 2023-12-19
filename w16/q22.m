clc;clear;
A=[4 -1 -1 -1;-1 4 -1 -1;-1 -1 4 -1;-1 -1 -1 4];
b=ones(4,1);
x0=zeros(4,1);%初值
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
omgea=0.4:0.01:1.8;
I=length(omgea);
N=zeros(1,length(omgea));%迭代步数
for i=1:length(N)
    B=(D-omgea(i)*L)\((1-omgea(i))*D+omgea(i)*U);
    f=omgea(i)*(D-omgea(i)*L)\b;
    epsilon=1;%误差初始值
    n=0;
    while epsilon>10^(-8)
        d=x0;
        x0=B*x0+f;
        c=x0;
        epsilon=norm(c-d,"inf");
        n=n+1;
    end
    N(i)=n;
end
plot(omgea,N,'r-');
xlabel('松弛因子');
ylabel('迭代步数');
grid on;
