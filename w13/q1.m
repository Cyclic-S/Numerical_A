%page153ex5
clc
clear
A=[1 2 3;2 5 2;3 1 5];
b=[14;18;20];
%使用内置函数lu
[L,U]=lu(A);
y=L\b;
x=U\y;
%使用lu_decomposition
[L1,U1]=lu_decomposition(A);
y1=L1\b;
x1=U1\y1;
%直接计算
x2=A\b;