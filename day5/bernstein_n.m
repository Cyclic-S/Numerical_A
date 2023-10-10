function y=bernstein_n(f,n)
%f为[0,1]区间上的连续函数
%n为Bernstein多项式的次数
syms x
y=0;
f1=matlabFunction(f);
for k=0:1:n
    B_in=nchoosek(n,k)*x^k*(1-x)^(n-k);%Bernstein基底
    y=y+f1(k/n)*B_in;
end
y=collect(y);
end