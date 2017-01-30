% Set up problem.
A = [1,2,1,0; 1,2,0,1];
b = [4;7];
c = [1;-1;0;0];
basicvars = [3,4; 3,2; 3,1; 4,2; 4,1; 1,2];

% Get feasible permutations and number of basic solutions.
[feasible_array, num_basic] = calc_basic(A, b, c, basicvars);

disp('Number of basic solutions: ')
num_basic

disp('Number of feasible solutions: ')
size(feasible_array, 2) % Count columns.

disp('Feasible combinations: ')
feasible_array
