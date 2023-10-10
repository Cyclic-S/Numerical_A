function y=lagrangeslove(X,Y)
%X=matrix of 1\times n 各X坐标
%Y=matrix of 1\times n 相应的Y
    syms x
    s1=0;
    for i=1:length(X)
        t=1;
        for j=1:length(Y)
            if j~=i
                t=t*(x-X(j))/(X(i)-X(j));
            end
        end
        s1=s1+Y(i)*t;
    end
    y=collect(s1,x);%合并x项
    z=min(X):0.01:max(X);
    s2=matlabFunction(s1);
    plot(z,s2(z));
    hold on
    plot(X,Y,'ro');
end