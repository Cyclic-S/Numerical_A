%page177ex9
clc
clear
A=[2 -1 0 0 0;-1 2 -1 0 0;0 -1 2 -1 0;0 0 -1 2 -1;0 0 0 -1 2];
b=[1;0;0;0;0];
%使用内置函数chol
L=chol(A);%L'L=A
y=L'\b;
x=L\y;
%使用cholesky_Factorization
L1=cholesky_Factorization(A);%L1L1'=A
y1=L1\b;
x1=L1'\y1;
%直接计算
x2=A\b;