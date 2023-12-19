%% Jacobi
clc;clear;
A=[1 2 -2;1 1 1;2 2 1];
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=D\(L+U);
b=[1 1 1]';
f=D\b;
N=10;%迭代次数
x0=[0,0,0]';%迭代初始值
j=0;
while j<N
    x0=B*x0+f;
    j=j+1;
    disp(x0);
end
%% G-S
clc;clear;
A=[1 2 -2;1 1 1;2 2 1];
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=(D-L)\U;
b=[1 1 1]';
f=(D-L)\b;
N=10;%迭代次数
x0=[0,0,0]';%迭代初始值
j=0;
while j<N
    x0=B*x0+f;
    j=j+1;
    disp(x0);
end