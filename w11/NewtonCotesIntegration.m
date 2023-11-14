function result=NewtonCotesIntegration(f,a,b,n)
syms x t
h=(b-a)/n;
X=a:h:b;
f1=matlabFunction(f);
Y=f1(X);
S=zeros(1,n+1);
for k=0:n
    prod_c=1;
    for j=0:n
        if j~=k
            %prod_c=prod_c*(t-j)/(k-j);
            prod_c=prod_c*(t-j);
        end
    end
    int_prod=int(prod_c,0,n);
    %S(k+1)=h/(b-a)*int_prod;
    S(k+1)=(-1)^(n-k)/(n*factorial(k)*factorial(n-k))*int_prod;
end
result=vpa(sum(Y.*S)*(b-a));
end