clc
clear

A=[5,1,-1,-2;2,8,1,3;1,-2,-4,-1;-1,3,2,7];
b=[-2,-6,6,12]';
%%直接法
%A\b
%%Inverse of  Matrix A
%inv(A)*b
%%Jacobi(A=D-L-U)
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
x0=[1,1,1,1]';%迭代初值
eps=1
while eps>10^(-8)
    x1=D^(-1)*(L+U)*x0+D^(-1)*b;
    eps=(x1-x0)'*(x1-x0);
    x0=x1;
end
x_result=x1
    
