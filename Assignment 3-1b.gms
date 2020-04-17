*Jang suk Charlie Roh
set
t time period /1*10/
;
Alias (t,tau,tau2)
;
parameters
p(t) production cost per unit /1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1/
h(t) inventory holding cost per unit /1 1,2 1,3 1,4 1,5 1,6 1,7 1,8 1,9 1,10 1/
pc(t) setup charges /1 10,2 10,3 10,4 10,5 10,6 10,7 10,8 10,9 10,10 10/
d(t) demand /1 10,2 20,3 30,4 40,5 50,6 60,7 70,8 80,9 40,10 30/
;
variable
z cost
;
positive variable
q(t,tau) production amount in period t to satisfy demand in period tau where tau >= t
s(t) inventory amount
;

binary variable
y(t) yes or no on production at period t
;

scalar
M big M
;
M = sum(t,d(t))
;
equations
obj objective funtion on cost
e1 production constraint
e2 production constraint2
;

obj.. z =e= sum(t,pc(t)*y(t)) + sum(t,sum(tau$(ord(tau)>=ord(t)),(p(t) + sum(tau2$(ord(tau2)>=ord(t) and ord(tau2)<=ord(tau)-1),h(tau2)))*q(t,tau)))
;
e1(t).. sum(tau$(ord(tau)<=ord(t)),q(tau,t)) =e= d(t)
;
e2(t,tau)..q(t,tau) =l= M*y(t)
;
model lot_sizing /all/
;
solve lot_sizing using rmip minimizing z
;
display q.l,y.l,z.l
;

solve lot_sizing using mip minimizing z
;
display q.l,y.l,z.l
;