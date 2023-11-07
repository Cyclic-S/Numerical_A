%% base {1,x}
clc
clear
G=zeros(2,2);
syms x
B=[1 x];
X=[10 11 12 13 14 15];
Y=[20 23 25 27 26 28];
%Gram Matrix
for i=2:2
    f1=matlabFunction(B(i));
    for j=2:2
        f2=matlabFunction(B(j));
        G(i,j)=f1(X)*f2(X)';
    end
end
for j=2:2
    f3=matlabFunction(B(j));
    G(1,j)=sum(f3(X));
end 
G(1,1)=length(X);
for j=2:2
    G(j,1)=G(1,j);
end
D=zeros(2,1);
for i=1:2
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
legend({'一次拟合多项式曲线','实验数据'});
%% base {1,x,x^2}
clc
clear
G=zeros(3,3);
syms x
B=[1 x x^2];
X=[10 11 12 13 14 15];
Y=[20 23 25 27 26 28];
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