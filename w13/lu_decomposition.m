function [L,U]=lu_decomposition(A)
[m,n]=size(A);
L=eye(m);
L(:,1)=A(:,1)/A(1,1);%L第一列赋值
U=zeros(m,n);
U(1,:)=A(1,:);%U第一行赋值
for i=2:m
    for j=2:n
        if i<=j
            U(i,j)=A(i,j)-sum(L(i,1:i-1).*U(1:i-1,j)');
        else
            if U(j,j)==0
                L(i,j)=0;
            else
                L(i,j)=(A(i,j)-sum(L(i,1:j-1).*U(1:j-1,j)'))/U(j,j);
            end
        end
    end
end
end