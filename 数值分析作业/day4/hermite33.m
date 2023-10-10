function y=hermite33(X,Y,i,DY_i)
%适用于n点n次Hermite插值
%X为前n点的横坐标(1\times n)
%Y为前n点的纵坐标(1\times n)
%DY_i为第i个点处的一阶导数值
    syms x a
    n=length(X);
    y=Y(1);
    A=[X',Y',zeros(n,n-1)];%均差表(l=n+1,h=n)
    for l=3:n+1 %列
        for h=l-1:n %行
            A(h,l)=(A(h,l-1)-A(h-1,l-1))/(X(h)-X(h-l+2));
        end
    end
    for h=2:length(X)
        y=y+A(h,h+1)*prod(x-X(1:h-1));%前n-1项
    end
    y1=y+a*prod(x-X(1:n));
    a1=solve(diff(y1,x)==DY_i,a);%符号运算求解
    a2=subs(a1,x,X(i));%代值已知f'(x_i)求a
    y2=y+a2*prod(x-X(1:n));
    y=collect(y2,x);%化简
end