%% base {1,x,x^2}
clc
clear
G=zeros(3,3);
syms x
B=[1 x x^2];
X=[-1 -0.8 -0.6 -0.4 -0.3 -0.1 0 0.2 0.4 0.6 0.8 1];
Y=[0 1.27 2.16 2.86 3.44 3.87 4.15 4.37 4.51 4.58 4.62 4.64];
%Gram Matrix
for i=2:3
    f1=matlabFunction(B(i));
    for j=2:3
        f2=matlabFunction(B(j));
        G(i,j)=f1(X)*f2(X)';
    end
end
for j=2:3
    f3=matlabFunction(B(j));
    G(1,j)=sum(f3(X));
end 
G(1,1)=length(X);
for j=2:3
    G(j,1)=G(1,j);
end
D=zeros(3,1);
for i=1:3
    if i==1
        D(i,1)=sum(Y);
    else
        f4=matlabFunction(B(i));
        D(i,1)=f4(X)*Y';
    end
end
A=G\D;
y=0;
for i=1:length(A)
    y=y+A(i)*x^(i-1);
end
y=collect(y,x);
fplot(y,[min(X) max(X)]);
hold on
plot(X,Y,'ro');
legend({'二次拟合多项式曲线','实验数据'});
%% base {1,x,x^2,x^3}
clc
clear
G=zeros(4,4);
syms x
B=[1 x x^2 x^3];
X=[-1 -0.8 -0.6 -0.4 -0.3 -0.1 0 0.2 0.4 0.6 0.8 1];
Y=[0 1.27 2.16 2.86 3.44 3.87 4.15 4.37 4.51 4.58 4.62 4.64];
%Gram Matrix
for i=2:4
    f1=matlabFunction(B(i));
    for j=2:4
        f2=matlabFunction(B(j));
        G(i,j)=f1(X)*f2(X)';
    end
end
for j=2:4
    f3=matlabFunction(B(j));
    G(1,j)=sum(f3(X));
end 
G(1,1)=length(X);
for j=2:4
    G(j,1)=G(1,j);
end
D=zeros(4,1);
for i=1:4
    if i==1
        D(i,1)=sum(Y);
    else
        f4=matlabFunction(B(i));
        D(i,1)=f4(X)*Y';
    end
end
A=G\D;
y=0;
for i=1:length(A)
    y=y+A(i)*x^(i-1);
end
y=collect(y,x);
fplot(y,[min(X) max(X)]);
hold on
plot(X,Y,'ro');
legend({'三次拟合多项式曲线','实验数据'});