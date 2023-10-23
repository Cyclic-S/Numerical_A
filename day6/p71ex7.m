%% P71ex7
syms x;
f=exp(x);
S=0;
for n=0:3
    S=(2*n+1)/2*int(f*legendremap(n),-1,1)*legendremap(n)+S;
end
collect(S,x)
fplot(S,[-1,1]);
hold on
fplot(f,[-1 1]);