*Jang suk Charlie Roh
set
i all species /1*14/
m(i) metabolites /1*5/
e(i) enzymes /6*14/
;
parameter
x_m_base(m) base metabolite value /1 0.0345, 2 1.011, 3 9.144, 4 0.0095, 5 1.1278/ 
x_e_base(e) base enzyme value /6 19.7,7 68.7, 8 31.7, 9 49.9, 10 3440, 11 14.31, 12 203, 13 25.1, 14 0.042/
y_m_base(m) base metabolite geometric transformation
y_e_base(e) base enzyme geometric transformation
;
y_m_base(m) = log(x_m_base(m))
;
y_e_base(e) = log(x_e_base(e))
;

variables
z rate of ethanol production
ym(m) concentration of metabolites(exp(ym) = xm)
ye(e) concentration of enzymes(exp(ye) = xe)
;
*y(11), y(12), y(14) are fixed
ye.fx("11") = y_e_base("11")
;
ye.fx("12") = y_e_base("12")
;
ye.fx("14") = y_e_base("14")
;
equations
obj rate of ethanol production
e1 dx1_dt transformed
e2 dx2_dt transformed
e3 dx3_dt transformed
e4 dx4_dt transformed
e5 dx5_dt transformed
e6(m) physiological contraints on metabolites lower bound
e7(m) physiological contraints on metabolites upper bound
e8(e) technological constraints on enzymes lower bound
e9(e) technological constraints on enzymes upper bound
;
obj..z =e= log(0.0945) + 0.05*ym('3') + 0.533*ym('4') - 0.0822*ym('5') + ye('10')
;
e1..log(0.8122)- 0.2344*ym('2') + ye('6') =e= log(2.8632) + 0.7464*ym('1') + 0.0243*ym('5') + ye('7')
;
e2..log(2.8632) + 0.7464*ym('1') + 0.0243*ym('5') + ye('7') =e= log(0.5239) + 0.735*ym('2') - 0.394*ym('5') + 0.999*ye('8') + 0.001*ye('11')
;
e3..log(0.5232) + 0.7318*ym('2') - 0.3941*ym('5') + ye('8') =e= log(0.0148) + 0.584*ym('3') + 0.03*ym('4')+ 0.119*ym('5') + 0.944*ye('9') + 0.056*ye('12') -0.575*ye('14')
;
e4..log(0.022) + 0.6159*ym('3') + 0.1308*ym('5') + ye('9') - 0.6088*ye('14') =e= log(0.0945) + 0.05*ym('3') + 0.533*ym('4') - 0.0822*ym('5') + ye('10')
;
e5..log(0.0913) + 0.333*ym('3') + 0.266*ym('4') + 0.024*ym('5') + 0.5*ye('9') + 0.5*ye('10') - 0.304*ye('14') =e= log(3.2097) + 0.198*ym('1') + 0.196*ym('2') + 0.372*ym('5') + 0.265*ye('7') + 0.265*ye('8') + 0.0002*ye('11') + 0.47*ye('13')
;
e6(m)..log(0.8*x_m_base(m)) =l= ym(m) 
;
e7(m).. ym(m) =l= log(1.2*x_m_base(m))
;
e8(e)..log(x_e_base(e)) =l= ye(e)
;
e9(e)..ye(e) =l= log(50*x_e_base(e))
;
model fermentation /all/
;

solve fermentation using lp maximizing z
;

display ym.l, ye.l,z.l
;
