*Jang suk Roh
*HW7 P4 B
Variables
x1 olefin feed(barrels per day)
x2 isobutane recyle (barrels per day)
x3 acid addition rate (1000s pounds per day)
x4 alkylate yield (barrels per day)
x5 isobutane input (barrels per day)
x6 acid strength (weight percent)
x7 motor octane number alkylate
x8 external isobutane to olefin ratio
x9 acid dilution factor
x10 f-4 performance no of alkylate
z profit and objective value ($ per day)
rx4 relaxation of x4
rx7 relaxation of x7
rx9 relaxation of x9
rx10 relaxation of x10
;
equations
eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11,eq12,eq13,eq14,eq15,obj;

eq1.. rx4 =e= x1*(1.12 + 0.12167*x8 - 0.0067*x8**2);
eq2.. rx7 =e= 86.35 + 1.098*x8**2 + 0.325*(x6-89);
eq3.. rx9 =e= 35.82 - 0.222*rx10;
eq4..rx10 =e= 3*rx7 - 133;
eq5..x8 =e= (x2+ x5)/x1;
eq6..x5 =e= 1.22*rx4 - x1;
eq7..x6*(rx4*rx9 + 1000*x3) =e= 98000*x3;
eq8..0.99*x4 =l= rx4;
eq9..0.99*x7 =l= rx7;
eq10..0.99*x9 =l= rx9;
eq11..0.9*x10 =l= rx10;
eq12..rx4 =l= 1.01*x4;
eq13..rx7 =l= 1.01*x7;
eq14..rx9 =l= 1.01*x9;
eq15..rx10 =l= 1.11*x10;
obj.. z =e= 0.063*x4*x7 - 5.04*x1 - 0.0035*x2 - 10*x3 - 3.36*x5;

*in order to avoid divide by 0 error lower bound for x1 is set to 1e-6
x1.lo = 1e-6;
x1.up = 100000;
x2.lo = 0;
x2.up = 100000;
x3.lo = 0;
x3.up = 100000;
x4.lo = 0;
x4.up = 100000;
x5.lo = 0;
x5.up = 100000;
x6.lo = 85;
x6.up = 93;
x7.lo = 90;
x7.up = 95;
x8.lo = 3;
x8.up = 12;
x9.lo = 1.2;
x9.up = 4;
x10.lo = 145;
x10.up = 162;

model alkylation /all/;
solve alkylation using nlp maximizing z;
display z.l,x1.l,x2.l,x3.l,x4.l,x5.l,x6.l,x7.l,x8.l,x9.l,x10.l,rx4.l,rx7.l,rx9.l,rx10.l;

