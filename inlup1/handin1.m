% Handin1 FMA240

%% Problem 2

A = [1 1 1 0 0; 1 0 0 1 0; 8 20 0 0 1];
b = [1;3/4;10];
c = [2; 1; 0; 0; 0];

basicvars = [3 4 5];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
disp('Problem 2a');
tableau

basicvars = [3 1 5];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
disp('Problem 2b');
tableau

basicvars = [3 1 2];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
disp('Problem 2c');
tableau

%% Problem 3

A = [3 2 1 0 0; 5 1 1 1 0; 2 5 1 0 1];
b = [1; 3; 4];
c = [-1; -1; -1; -1; -1];

basicvars = [3 4 5];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
disp('Problem 3a');
tableau

basicvars = [2 4 5];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
disp('Problem 3b');
tableau

%% Problem 4

% First iteration.
A = [1 2 2 1 1 0 1 0 0; 1 2 1 1 2 1 0 1 0; 3 6 2 1 3 0 0 0 1];
b = [12; 18; 24];
c = [0; 0; 0; 0; 0; 0; -1; -1; -1];
basicvars = [7 8 9];
[tableau, x, basic, feasible, optimal] = simplex(A, b, c, basicvars);
tableau

% Second iteration.
A = [1 2 2 1 1 0; 1 2 1 1 2 1; 3 6 2 1 3 0 ];
c = [1; -2; -3; -1; -1; 2];
basicvars = [3 6 2];
[tableau, x, basic, feasible, optimal] = simplex(A, b, c, basicvars);
tableau

%% Problem 5

A=[2,-3,2,1,0;-1,1,1,0,1];
b=[3;5];
c=[3;2;1;0;0];
basicvars = [4 5];
disp('Problem 5');
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars)

% Step 2.
basicvars = [1 5];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars)

% Step 3.
basicvars = [3 5]
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars)

% Step 4.
basicvars = [2 5]
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars)

%% Problem 6.
disp('Problem 6');

A= [1,2,1,0;1,2,0,1];
b=[4;7];
c=[1;-1;0;0];
basicvars = [2 1; 1 3; 1 4; 2 3; 2 4; 3 4];
[feasible_array, num_basic] = calc_basic(A, b, c, basicvars);
disp('Num basic solutions:')
num_basic
disp('Num basic feasible solutions:')
feasible_array
size(feasible_array, 2)
