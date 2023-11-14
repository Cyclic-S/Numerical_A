clc
clear
syms x t
R=6371;H=2384;h=439;
a=(2*R+H+h)/2;c=(H-h)/2;
f=sqrt(1-(c/a)^2*sin(x)^2);
xmin=0;xmax=pi/2;
f1=matlabFunction(f);
%梯形公式
I11=a*NewtonCotesIntegration(f,xmin,xmax,1);
%Simpson公式
I21=a*NewtonCotesIntegration(f,xmin,xmax,1);
%柯特斯公式
I31=a*NewtonCotesIntegration(f,xmin,xmax,1);