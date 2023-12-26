clc;clear;
syms x
f=4*x^4-10*x^3+1.25*x^2+5*x-0.5;
phi=x-f/diff(f);
phi=matlabFunction(phi);
c=-0.6;%c=0.099; %c=0.96; %c=2;
esplion=1;
while esplion>10^(-16) 
    esplion=phi(c)-c;
    c=phi(c);
end
result=phi(c);