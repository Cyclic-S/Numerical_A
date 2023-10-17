(* ::Package:: *)

a=-1;
b=1;
rho=1;
n=7;
P=Table[x^k,{k,0,n}];
For[i=3,i<=n+1,i++,
P[[i]]=x^(i-1)-Sum[(Integrate[rho x^(i-1) P[[j]],{x,a,b}])/(Integrate[rho P[[j]]^2,{x,a,b}])P[[j]],{j,1,i-1}]
];
P
