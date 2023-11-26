function y=legendremap(n)
%递推公式法求Legendre多项式
syms x;
P0=1;
P1=x;
for i=1:n-1
    P_idelete1=P0;
    P_i=P1;
    P_iadd1=(2*i+1)/(i+1).*x*P_i-i/(i+1)*P_idelete1;
    P0=P_i;
    P1=P_iadd1;
end
if n==0
    y=1;
elseif n==1
    y=x;
else
    y=collect(P_iadd1);
end
end
%示例
%legendremap(6)