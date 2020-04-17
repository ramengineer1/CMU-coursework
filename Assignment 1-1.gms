*Jang suk Charlie Roh
Sets
i cargo type /1*4/
j compartment /1*3/
;
*front = 1; center = 2; back = 3

Parameters
p(i) profit per ton /1 320, 2 400, 3 360, 4 290/
a(i) available cargo /1 20, 2 16, 3 25, 4 13/
v(i) volume per ton /1 500, 2 700, 3 600, 4 400/

wc(j) weight capacity /1 12, 2 18, 3 10/
sc(j) space capacity / 1 7000, 2 9000, 3 5000/
;

Positive Variables
x(i,j) cargo quantity for shipping
;
Variables
z profit
wf weight fraction
;
wf.lo = 0;
wf.up = 1;
*weight fraction is [0,1]

Equations
obj profit
e1(j) weight constraint
e2(j) space constraint
e3(i) available cargo constraint
e4(j) equal cargo proportion constraint
;

e1(j)..sum(i,x(i,j)) =l= wc(j);
e2(j)..sum(i,v(i) * x(i,j)) =l= sc(j);
e3(i)..sum(j,x(i,j)) =l= a(i);
e4(j)..sum(i,x(i,j))/wc(j) =e= wf;
obj..z=e=sum((i,j),p(i)*x(i,j));

Model cargo /all/
;
Solve cargo using LP maximizing z
;
Display z.l, x.l, wf.l
;
