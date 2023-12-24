clc
clear
syms x t
R=6371;H=2384;h=439;
a=(2*R+H+h)/2;c=(H-h)/2;
f=sqrt(1-(c/a)^2*sin(x)^2);
xmin=0;xmax=pi/2;
f1=matlabFunction(f);
S=12176.8596279750388997885325568;%from Mathematica N[S,30]
X=1:7;
Y=1:7;
for i=1:7
    Y(i)=S-a*NewtonCotesIntegration(f,xmin,xmax,X(i));
end
plot(X,Y,'r-o');grid on;
legend('Mathematica计算结果减NC公式计算结果');
xlabel('牛顿科特斯公式划分数目');
%% 结果
%由上则n=2时(Simpson)计算结果与Mathematica结果更接近
I=a*NewtonCotesIntegration(f,xmin,xmax,2);
disp(I);