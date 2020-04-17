*Jang suk Charlie Roh
set
f feature /1*6/
;
binary variable
y(f) feature install or not
;
variable
z total cost
;
parameter
*cost & budget in terms of $1000
c(f) cost /1 10.2, 2 6, 3 23, 4 11, 5 9.8, 6 31.6/
sg(f) speed gain /1 8, 2 3, 3 15, 4 7, 5 10, 6 12/
s /30/
;
equation
obj objective function
e1 speed gain constraint
;
obj..z =e= sum(f,c(f)*y(f))
;
e1..sum(f,sg(f)*y(f)) =g= s
;
model racecar2 /all/
;
solve racecar2 using mip minimizing z
;
display z.l,y.l
;
