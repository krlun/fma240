function [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
% [x, basic, optimal, feasible] = checkbasic1(A, b, c, basicvars),
% INPUT: A - mxn matrix
%        b - mx1 matrix
%        c - nx1 matrix
%        basicvars - list of m indices between 1 and n.
% OUTPUT
%        tableau  - the (m+1) x (n+1) matrix representing the simplex
%                   tableau (skip the column correspondig to the objective
%                   function z)
%        x        - nx1 matrix. The basic solution corresponding to basic
%                   variables basicvars.
%        basic    - 1 if x is a basic soluton
%        optimal  - 1 if x is an optimal solution
%        feasible - 1 if x is a feasible solution to the LP-problem in
%                   canonical form
%                       max z = c'*x
%                       subject to A*x = b, x >= 0

A_B = A(:, [basicvars]);
A_N = A;
A_N(:, [basicvars]) = [];
c_B = c([basicvars]);
c_N = c;
c_N([basicvars]) = [];

c_B'*inv(A_B)*A_N-c_N'
c_B'*inv(A_B)*b

tableau = inv(A_B)*A_N
inv(A_B)*b

x = 0;
basic = 0;
feasible = 0;
optimal = 0;

end