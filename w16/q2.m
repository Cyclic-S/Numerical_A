clc;clear;
A=[4 -1 -1 -1;-1 4 -1 -1;-1 -1 4 -1;-1 -1 -1 4];
b=ones(4,1);
x0=zeros(4,1);%初值
omgea=0.01:0.01:1.99;
I=length(omgea);
N=zeros(1,length(omgea));%迭代步数
for i=1:length(N)
    N(i)=SOR(A,b,x0,omgea(i));
end
plot(omgea,N,'r-');
xlabel('松弛因子');
ylabel('迭代步数');
grid on;

function n=SOR(A,b,x0,omgea)
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=(D-omgea*L)\((1-omgea)*D+omgea*U);
f=omgea*(D-omgea*L)\b;
n=0;
epsilon=1;%误差初始值
while epsilon>=10^(-8)
    d=x0;
    x0=B*x0+f;
    c=x0;
    epsilon=max(abs(c-d));
    n=n+1;
end
end