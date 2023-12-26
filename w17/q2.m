clc;clear;
syms x
a=3:0.01:15;
Na=zeros(1,length(a));
c=zeros(1,1);
esplion=zeros(1,1);
for i=1:length(a)
    c=a(i);
    esplion=1;
    phi=x-(x^2-a(i))/(2*x);
    phi=matlabFunction(phi);
    while esplion>10^(-16) 
        esplion=phi(c)-c;
        c=phi(c);
    end
    Na(i)=phi(c);
end
