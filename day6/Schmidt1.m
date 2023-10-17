function s=Schmidt1(a,b,rho,n)
syms x
sum=0;
P=[1,x];
for i=2:n
    P=[P,x^i];
end
for i=2:n
    for k=1:i
        sum=sum-P(k)*int(rho*x^i*P(k),a,b)/int(rho*P(k)*P(k),a,b)*P(k);
    end
    P(i+1)=x^i+sum;
end
s=P;