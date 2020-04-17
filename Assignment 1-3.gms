positive variables
x1,x2,x3;

variable
z;


equations
e1
e2
e3
obj
;

e1..2*x1 + x2 + x3 =l=2;
e2..x1 + 2*x2 + 3*x3 =l=5;
e3..2*x1 + 2*x2 + x3 =l=6;
obj..z =e= 3*x1 + x2 + 3*x3;

model this /all/;

solve this using LP maximizing z;

display x1.l,x2.l,x3.l,z.l