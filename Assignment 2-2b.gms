*Jang suk Charlie Roh
set
p process /1*3/
m material /a,b/
;
*cost and profit in terms of $100
parameters
fc(p) fixed cost /1 10, 2 15, 3 20/
vc(p) variable cost/1 2.5, 2 4.0, 3 5.5/
xi(p) conversion /1 0.90, 2 0.82, 3 0.95/
mc(m) material cost /a 5, b 9.5/
s1 price for xcall<= 10 /18/
s2 price for xcall >10 /15/
M1 /5/
;
binary variable
y(p)
ys
;
positive variable
x(m) amount of material purchased
;

variable
z profit
xball xb total
xcall xc total
;
xcall.up = 15
;
x.up("a") = 16
;

equations
obj objective function
e1 xb all relationship
e2 xc all relationship
e3 mutual exclusivity y("2") & y("3")
e4 conditional constraint for xcall > 10

;
*profit = -fixed cost - variable cost - material cost + sales
obj.. z =e= -sum(p$(ord(p)<=1),fc(p)*y(p) + vc(p)*x("a")*y(p)) - sum(p$(ord(p)>=2),fc(p)*y(p) + vc(p)*xball*y(p)) - sum(m,mc(m)*x(m)) + xcall*s1*ys +(s1*10 + (xcall-10)*s2)*(1-ys)
;
e1.. xball =e= x("a")*xi("1")*y("1") + x("b")
;
e2.. xcall =e= sum(p$(ord(p)>=2), xball*xi(p)*y(p))
;
e3.. sum(p$(ord(p)>=2),y(p)) =e= 1
;
e4.. xcall - 10 =g= M1*(1-ys)
;
model chem_plant /all/
;
solve chem_plant using minlp maximizing z
;
display x.l,y.l,ys.l,z.l,xcall.l
;




