*Jang suk Roh
Variable
x1,x2;
equation
eq1,eq2;
eq1.. x1 - x2**2 + 1 =l= 0;
eq2..-x1 - x2**2 + 1 =l= 0;
x1.l = 0;
x2.l = 0;
model aaa /all/;
option nlp = snopt;
solve aaa using nlp minimizing x1;
display x1.l,x2.l;
