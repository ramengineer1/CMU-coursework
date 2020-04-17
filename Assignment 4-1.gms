*Jang suk Charlie Roh
Set
i products /a*e/
j stages /1*6/
;
Parameters
Q(i) demand for each product /a 250000, b 150000, c 180000, d 160000, e 120000/
alpha(j) cost coefficient /1 2500, 2 2500, 3 2500, 4 2500, 5 2500, 6 2500/
beta(j) cost exponent /1 0.6, 2 0.6, 3 0.6, 4 0.6, 5 0.6, 6 0.6/
;
scalar
H time horizon /6200/
;
Table
s(i,j) size factor

            1       2       3       4       5       6
    a       7.9     2       5.2     4.9     6.1     4.2
    b       0.7     0.8     0.9     3.4     2.1     2.5 
    c       0.7     2.6     1.6     3.6     3.2     2.9
    d       4.7     2.3     1.6     2.7     1.2     2.5     
    e       1.2     3.6     2.4     4.5     1.6     2.1
;

Table
tau(i,j) processing time

            1       2       3       4       5       6
    a       6.4     4.7     8.3     3.9     2.1     1.2
    b       6.8     6.4     6.5     4.4     2.3     3.2
    c       1       6.3     5.4     11.9    5.7     6.2
    d       3.2     3       3.5     3.3     2.8     3.4
    e       2.1     2.5     4.2     3.6     3.7     2.2
;
Variables
z cost
V(j) volume of unit in stage j
B(i) size of batch
T(i) cycle time for product i
nb(i) number of batches for product i
;
Integer variable
N(j) nmber of units in stage j
;
B.lo(i) = 0.01;
T.lo(i) = 0;
V.lo(j) = 0;
N.lo(j) = 1;

Equations
obj production cost
e1(i,j) volume constraint
e2(i) time horizon equation
e3 time horizon constraint
e4(i,j) cycle time constraint
e5(i) number of bathces equation
;

obj.. z=e= sum(j,N(j)*alpha(j)*v(j)**beta(j))
;
e1(i,j)..V(j) =g= s(i,j)*B(i)
;
e2(i).. T(i) =e= smax(j,tau(i,j)/N(j))
;
e3.. sum(i,T(i)*Q(i)/B(i)) =l= H
;
e4(i,j).. T(i) =g= tau(i,j)/N(j)
;
e5(i).. nb(i) =e= Q(i)/B(i)
;
model batch_process /all/
;

solve batch_process using minlp minimizing z
;
display V.l,B.l,T.l,nb.l,N.l,Z.l
;

