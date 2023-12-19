%% Jacobi
clc;clear;
A=zeros(50,50)+diag(12*ones(1,50));
for i=1:length(A(:,1))-1
    A(i,i+1)=-2;
end
for i=1:length(A(:,1))-2
    A(i,i+2)=1;
end
for i=1:length(A(:,1))%行
    for j=1:i%列
        A(i,j)=A(j,i);
    end
end
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=D\(L+U);
b=5*ones(50,1);
f=D\b;
x=A\b;%精确值
x0=0.01*ones(50,1);%迭代初始值
epsilon=1;%误差初始值
while epsilon>10^(-14)
    x0=B*x0+f;
    epsilon=norm(x0-x,"inf");
end
disp(x0);
%% G-S
clc;clear;
clc;clear;
A=zeros(50,50)+diag(12*ones(1,50));
for i=1:length(A(:,1))-1
    A(i,i+1)=-2;
end
for i=1:length(A(:,1))-2
    A(i,i+2)=1;
end
for i=1:length(A(:,1))%行
    for j=1:i%列
        A(i,j)=A(j,i);
    end
end
D=diag(diag(A));%对角阵
L=D-tril(A);%下三角阵
U=D-triu(A);%上三角阵
B=(D-L)\U;
b=5*ones(50,1);
f=(D-L)\b;
x=A\b;%精确值
x0=0.01*ones(50,1);%迭代初始值
epsilon=1;%误差初始值
while epsilon>10^(-14)
    x0=B*x0+f;
    epsilon=norm(x0-x,"inf");
end
disp(x0);