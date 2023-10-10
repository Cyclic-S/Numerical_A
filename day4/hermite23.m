function y=hermite23(X,Y,DY_all)
%2点3次Hermite插值
%X为2点的横坐标(1\times 2)
%Y为2点的纵坐标(1\times 2)
%DY_all为2点处的一阶导数值(1\times 2)
    syms x
    y=(1+2*(x-X(1))/(X(2)-X(1)))*((x-X(2))/(X(1)-X(2)))^2*Y(1)+...
        (1+2*(x-X(2))/(X(1)-X(2)))*((x-X(1))/(X(2)-X(1)))^2*Y(2)+...
        (x-X(1))*((x-X(2))/(X(1)-X(2)))^2*DY_all(1)+...
        (x-X(2))*((x-X(1))/(X(2)-X(1)))^2*DY_all(2)
    y=collect(y);
end