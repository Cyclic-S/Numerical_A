%% 第一种递推方式
clc
clear
N=20;
IA=zeros(1,N);%积分值
EA=zeros(1,N);%误差估计
I0=0.6321;%by Mathematica I_0=0.632121...
EA(1)=5E-5;
IA(1)=1-I0;
for n=1:N-1
    IA(n+1)=1-(n+1)*IA(n);% k from 1 to 20
    EA(n+1)=n*EA(n);
end
disp(IA);
disp(EA);
%% Equation 第二种递推方式
clc
clear
N=20;
EB=zeros(1,N);%误差估计
IB=zeros(1,N);%积分值
IB(20)=0.0684;%by Mathematica I_{20}=0.0455449...
EB(20)=5E-2;
for n=N:-1:2
    IB(n-1)=1/n*(1-IB(n));% k from 1 to 20
    EB(n-1)=1/n*EB(n);
end
disp(IB);
disp(EB);