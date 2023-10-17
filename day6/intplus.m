function pl=intplus(a,b,rho,f,g)
%区间[a,b]上带权rho<f,g>的内积
pl=integral(rho*f*g,a,b);
end