%% 第一种递推方式
clc
clear
N=20;
IA=zeros(1,N);%积分值
EA=zeros(1,N);%误差值
I0=0.1823;%by Mathematica I_0=0.182322...
EA(1)=5E-6;
IA(1)=1-5*I0;
for n=1:N-1
    IA(n+1)=1/(n+1)-5*IA(n);% k from 1 to 20
    EA(n+1)=5*EA(n);
end
%% 第二种递推方式
clc
clear
N=20;
EB=zeros(1,N);%误差值
IB=zeros(1,N);%积分值
IB(20)=0.00799;%by Mathematica I_{20}=0.00799752...
EB(20)=5E-5;
for n=N:-1:2
    IB(n-1)=1/(5*n)-1/5*IB(n);% k from 1 to 20
    EB(n-1)=1/5*EB(n);
end