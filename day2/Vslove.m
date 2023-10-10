function y=Vslove(a,B)  %slove Matrix AX=B
%a=matrix of 1\times n
%B=matrix of n\times 1
    syms x
    y=0;
    A=zeros(length(a),length(a));
    A=vander(a);
    X=zeros(length(B'),1);%定义X矩阵n\times 1 即为多项式系数
    X=inv(A)*B;
    for i=1:length(X')
        y=y+X(length(X')+1-i)*x^(i-1);
    end
    y=collect(y,x);%合并x项
    t=min(a):0.01:max(a);
    y1=matlabFunction(y);
    plot(t,y1(t));
    hold on
    plot(a,B,'ro');
end