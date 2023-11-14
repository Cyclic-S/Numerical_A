%% I1=\int_1^9 \sqrt(x) dx
clc
clear
syms x t
f=sqrt(x);
a=1;b=9;
f1=matlabFunction(f);
%梯形公式
I1=(f1(a)+f1(b))*(b-a)/2;
I11=NewtonCotesIntegration(f,a,b,1);
%Simpson公式
I2=(f1(a)+4*f1((a+b)/2)+f1(b))*(b-a)/6;
I21=NewtonCotesIntegration(f,a,b,2);
%柯特斯公式
I31=NewtonCotesIntegration(f,a,b,4);
%% I2=\int_0^2 \sqrt(4-x^2) dx
clc
clear
syms x t
f=sqrt(4-x^2);
a=0;b=2;
f1=matlabFunction(f);
%梯形公式
I1=(f1(a)+f1(b))*(b-a)/2;
I11=NewtonCotesIntegration(f,a,b,1);
%Simpson公式
I2=(f1(a)+4*f1((a+b)/2)+f1(b))*(b-a)/6;
I21=NewtonCotesIntegration(f,a,b,2);
%柯特斯公式
I31=NewtonCotesIntegration(f,a,b,4);