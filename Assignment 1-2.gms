*Jang suk Charlie Roh
Sets
i Food /1*20/
*wheat, cornmeal, canned milk, margarine, cheese, peanut butter, lard, liver, pork roast, salmon, green beans, cabbage, onions, potatoes, spinach, sweet pot, peaches, prunes, lima beans, navy beans
j Nutrients /1*9/
*Calorie, protein, calcium, iron, vit a, vit b1, vit b2, niacin, vit c
;

Parameters
rn(j) Required nutrients /1 3, 2 70, 3 0.8, 4 12, 5 5, 6 1.8, 7 2.7, 8 18, 9 75/
;

Table
nv(i,j) Nutritive value per dollar spent

        1       2       3       4       5       6       7       8       9
    1   44.7    1411    2       365             55.4    33.3    441       
    2   36      897     1.7     99      30.9    17.4    7.9     106     
    3   8.4     422     15.1    9       26      3       23.5    11      60
    4   20.6    17      0.6     6       55.8    0.2     
    5   7.4     448     16.4    19      28.1    0.8     10.3    4       
    6   15.7    661     1       48              9.6     8.1     471     
    7   41.7                            0.2             0.5     5          
    8   2.2     333     0.2     139     169.2   6.4     50.8    316     525
    9   4.4     249     0.3     37              18.2    3.6     79      
    10  5.8     705     6.8     45      3.5     1       4.9     209     
    11  2.4     138     3.7     80      69      4.3     5.8     37      862
    12  2.6     125     4       36      7.2     9       4.5     26      5369
    13  5.8     166     3.8     59      16.6    4.7     5.9     21      1184
    14  14.3    336     1.8     118     6.7     29.4    7.1     198     2522
    15  1.1     106             138     918.4   5.7     13.8    33      2755
    16  9.6     138     2.7     54      290.7   8.4     5.4     83      1912
    17  8.5     87      1.7     173     86.8    1.2     4.3     55      57
    18  12.8    99      2.5     154     85.7    3.9     4.3     65      257
    19  17.4    1055    3.7     459     5.1     26.9    38.2    93      
    20  26.9    1691    1.4     792             38.4    24.6    217          
;

Positive Variables
x(i) Dollar spent on type of food
;
Variables
z Total dollar spent
;

Equations
e1(j) Daily nutrition constraint
obj total dollar spent
;

e1(j).. sum(i,nv(i,j) * x(i)) =g= rn(j);
obj.. z =e= sum(i,x(i));

Model nutrition /all/
;

Solve nutrition using LP minimizing z
;

Display x.l,z.l
;
