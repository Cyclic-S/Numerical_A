clc
clear
s=zeros(1,12);
for i=1:12
    %s(i)=factorial(i);%使用阶乘函数
    s(i)=prod(1:i);
end
result=sum(s);
disp(result);

