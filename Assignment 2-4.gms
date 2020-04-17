*Jang suk Charlie Roh
set
t time period /1*5/
*t(1)2020-2024, t(2)2025-2029, t(3)2030-2034, t(4)2035-2039, t(5)2040-2044
m mission/1*14/
*com satellite, orbital microwave, io lander, uranus orbiterA, uranus orbiterB, mercury probe, saturn probe, IR imaging, ground based SETI, large orbital structures, color imaging, medical technology, polar orbital platform, geosync SETI
;
*budget and cost in terms of $ billion
parameters
v(m) values of mission /1 200, 2 3, 3 20, 4 50, 5 70, 6 20, 7 5, 8 10, 9 200, 10 150, 11 18, 12 8, 13 300, 14 185/
b(t) budget of time period/1 10, 2 12, 3 14, 4 14, 5 14/
;
table
c(m,t) cost of mission for time period
            1       2       3       4       5
    1       6       
    2       2       3
    3       3       5       
    4                                       10
    5               5       8           
    6                       1       8       4
    7       1       8
    8                               5       
    9       4       5
    10              8       4
    11                      2       7
    12      5       7               
    13              1       4       1       1
    14              4       5       3       3
;
binary variables
y(m) launch mission or not
;
variables
z total value
;
equation
obj objective function
e1(t) budget constraint
e2 mutual exclusivity y4 & y5
e3 mutual exclusivity y8 & y11
e4 mutual exclusivity y9 & y14
e5 dependency y4 on y3
e6 dependency y5 on y3
e7 dependency y6 on y3
e8 dependency y7 on y3
e9 dependency y11 on y2
;

obj.. z =e= sum(m,v(m)*y(m))
;
e1(t).. sum(m,c(m,t)*y(m)) =l= b(t)
;
e2.. y("4") + y("5") =l= 1
;
e3.. y("8") + y("11") =l= 1
;
e4.. y("9") + y("14") =l= 1
;
e5..y("4") =l= y("3")
;
e6..y("5") =l= y("3")
;
e7..y("6") =l= y("3")
;
e8..y("7") =l= y("3")
;
e9..y("11") =l= y("2")
;

model nasa /all/
;
solve nasa using mip maximizing z
;
display z.l, y.l
;

