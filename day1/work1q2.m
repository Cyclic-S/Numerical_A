clc
clear
x=linspace(-2,3,100);
y=linspace(-1,7,100);
[X,Y]=meshgrid(x,y);
Z=X.^4-2.*X.^2.*Y+X.^2-2.*X.*Y+2.*Y.^2+9.*X./2-4.*Y+4;
fig=mesh(X,Y,Z);