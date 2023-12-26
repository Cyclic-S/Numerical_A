clc;clear;
syms x
f=exp(x)+10.*x-2;
f=matlabFunction(f);
esplion=1;
a=0;b=0.2;
while esplion>10^(-16)
    if f((a+b)/2)<0
        a=(a+b)/2;
        esplion=b-a;
    elseif f((a+b)/2)>0
        b=(a+b)/2;
        esplion=b-a;
    else
        esplion=0;
    end
    result=(a+b)/2;
end