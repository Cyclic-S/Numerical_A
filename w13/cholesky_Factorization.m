function L=cholesky_Factorization(A)
N=size(A);%记录矩阵的大小
m=N(1);%矩阵的行数
n=N(2);%矩阵的列数
L=zeros(m,n);%初始化L矩阵
for i=1:n
    L(i:n,i)=A(i:n,i);%将A的下半矩阵赋值给L
end
L(1,1)=sqrt(A(1,1));%步骤一：先算矩阵的第一个元素
L(2:n,1)=L(2:n,1)/L(1,1);%步骤二：利用第一个元素计算第一列元素
for k=2:n
    L(k,k)=sqrt(A(k,k)-L(k,k-1)*(L(k,k-1)));%步骤三：计算所有的对角线元素
    for j=k+1:n
        L(j,k)=(A(j,k)-L(j,k-1)*L(k,k-1))/L(k,k);%步骤四：计算对角线以下元素的值
    end
end
end