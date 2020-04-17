*Jang suk Charlie Roh
variables
x1
x2
z
;

x1.lo = 0;
x2.lo = 0;
x1.up = 1;
x2.up = 1;

equations
obj
e1
e2
;

obj..z=e=1.2*x1 + x2;
e1..x1+x2 =l= 1;
e2..1.2*x1 + 0.5*x2 =l=1;

model question /all/;

solve question using lp maximizing z;

display z.l,x1.l,x2.l