%% my''+wy'+vy=f(x) or my''+wy'=f(x,y),ivp:y(a)=p,y(b)=q;
% as for point  kth
% my(k)''+wy(k)'+y(k)=f(x(k)) or my(k)''+wy(k)'=f(x(k),y(k))
% y(k)''=(1/h^2)*(y(k-1)-2*y(k)+y(k+1))
% y(k)'=(1/h)*(y(k+1)-y(k))
% vy(k)=v*y(k)
%m=1,w=-2,v=1,f(x)=x*exp(x)
%%
clc
clear
format long
m=1;
w=-2;
v=1;
a=0;
b=1;
n=20;
h=(b-a)/n;
p=2;
q=4;
X=a:h:b;
Y=zeros(1,length(X));
Y(1)=2;
Y(length(X))=4;
syms x
f0=x*exp(x);
f=matlabFunction(f0);
%%Matrix Form AX=d
A=zeros(n-1,n-1);
d=zeros(n-1,1);
for k=2:n
    if k==2
        A(k-1,k-1)=(-2)*(m/h^2)-(w/h)+v;
        A(k-1,k)=(m/h^2)+(w/h);
        d(k-1)=f(X(k))-(m/h^2)*Y(k-1);
    end
    if k==n
       A(k-1,k-2)=(m/h^2);
       A(k-1,k-1)=(-2)*(m/h^2)-(w/h)+v;
       d(k-1)=f(X(k))-((m/h^2)+(w/h))*Y(k+1);
    end
    if k>2&&k<n
       A(k-1,k-2)=(m/h^2);
       A(k-1,k-1)=(-2)*(m/h^2)-(w/h)+v;
       A(k-1,k)=(m/h^2)+(w/h);
       d(k-1)=f(X(k));
    end
end
Z=A\d;
Y(1,2:n)=Z';
plot(X,Y,'r-*')





