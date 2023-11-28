function [L,U]=lu_decomposition(A)
% n=length(A);
% L=eye(n)+zeros(n,n);
% U=[A(1,:);zeros(n-1,n)];
% %L(1,:)
% for i=1:n
%     L(i,1)=A(i,1)/A(1,1);
% end
% %U(:,2)
% for j=2:n
%     U(2,j)=A(2,j)-L(2,1)*A(1,j);
% end
% %L(2,:)
% for i=1:n
%     L(i,2)=
% end
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