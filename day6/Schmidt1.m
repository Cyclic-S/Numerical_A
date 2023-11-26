function s=Schmidt1(a,b,rho,n)
%Schmidt正交化方法
syms x
P=[1,x];
for i=2:n
    P=[P,x^i];
end
for i=2:n
    sum=0;
    for k=1:i
        sum=sum+P(k)*int(rho*x^i*P(k),a,b)/int(rho*P(k)*P(k),a,b);
    end
    P(i+1)=x^i-sum;
end
s=P;
%示例Legendre多项式
%Schmidt1(-1,1,1,6)