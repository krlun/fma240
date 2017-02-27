%c = [11 Inf 8 8 0; 7 5 6 12 0; 7 6 8 5 0];
%s = [100; 120; 60];
%d = [50; 40; 90; 70; 30];

% Case a: supplier 1 delivers no more than 20 units to 4.
%     1     2       3   4a      4b      extra
t = 6*11;
ca = [11    t       8   8       t       0; 
      7     5       6   12      12      0; 
      7     6       8   5       5       0];
da = [50;   40;     90; 20;     50;     30];
sa = [100; 120; 60];

% Case b: supplier 1 delivers more than 20 units to 4.
%     1     2       3   4a      4b      extra
t = 6*12;
cb = [11    t       8   8       5       0; 
      7     5       6   t       12      0; 
      7     6       8   t       5       0];
db = [50;   40;     90; 20;     50;     30];
sb = [100; 120; 60];

[xa,costa]=transport(sa,da,ca)
[xb,costb]=transport(sb,db,cb)