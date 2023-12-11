h=0.1;
x=0.1:0.1:0.6;
y=[20.65,17.02,12.06,10.35,7.82,5.08];
x0=0.1:0.01:0.6;

N_Result=zeros(1,length(x0));
for k=1:length(x0)
    result=y(1);
    for i=1:length(x)-1
        if i==1
            a=diff(y)/h;
        end
        if i~=1
            a=diff(a)/(i*h);
        end
        result=result+a(1)*prod(x0(k)-x(1:i));
    end
    N_Result(k)=result;
end

plot(x0,N_Result,'b-*')
hold on
plot(x,y,'ro')