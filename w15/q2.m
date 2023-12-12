clc
clear
A=[8 -3 2;4 11 -1;6 3 12];
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=(D-L)\U;
b=[20 33 36]';
f=(D-L)\b;
x=[3,2,1]';%方程组的解
N=[10,20,100,200,1000];%迭代次数
for i=1:length(N)
    x0=[0,0,0]';%迭代初始值
    while j<N(i)+1
            x0=B*x0+f;
            j=j+1;
    end
    disp(x0);
    disp(max(abs(x0-x)));%误差值
end