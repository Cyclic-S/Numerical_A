function A=newtonmatrix(X,Y)
%均差表
    %X为所有x_i所构成的行向量
    %Y为所有y_i所构成的行向量
    n=length(X);
    A=[X',Y',zeros(n,n-1)];%l=n+1,h=n
    for l=3:n+1 %列
        for h=l-1:n %行
            A(h,l)=(A(h,l-1)-A(h-1,l-1))/(X(h)-X(h-l+2));
        end
    end
end