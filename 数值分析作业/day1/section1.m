clc
clear
s=zeros(1,12);
for i=1:12
    s(i)=factorial(i);%阶乘函数
end
result=sum(s)

