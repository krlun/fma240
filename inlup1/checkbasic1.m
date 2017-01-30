function [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
% [x, basic, optimal, feasible] = checkbasic1(A, b, c, basicvars),
% INPUT: A - mxn matrix
%        b - mx1 matrix
%        c - nx1 matrix
%        basicvars - list of m indices between 1 and n.
% OUTPUT
%        tableau  - the (m+1) x (n+1) matrix representing the simplex
%                   tableau (skip the column corresponding to the objective
%                   function z)
%        x        - nx1 matrix. The basic solution corresponding to basic
%                   variables basicvars.
%        basic    - 1 if x is a basic soluton
%        optimal  - 1 if x is an optimal solution
%        feasible - 1 if x is a feasible solution to the LP-problem in
%                   canonical form
%                       max z = c'*x
%                       subject to A*x = b, x >= 0

    % Set up default return values.
    [x, basic, optimal, feasible] = deal(0);

    s = size(A);
    nonbasicvars = 1:s(2);
    nonbasicvars([basicvars]) = [];
    A_B = A(:, [basicvars]);
    A_N = A(:, [nonbasicvars]);
    c_B = c([basicvars]);
    c_N = c([nonbasicvars]);
    ABAN = A_B\A_N;
    ABb = A_B\b;

%    tableau = [inv(A_B)*A_N eye(length(basicvars)) inv(A_B)*b; ...
%        c_B'*inv(A_B)*A_N-c_N' zeros(1, length(basicvars)), c_B'*inv(A_B)*b]

    tableau = zeros(s(1)+1, s(2)+1);
    tableau(1:end-1, basicvars) = eye(s(1));
    tableau(:, nonbasicvars) = [ABAN; c_B'*ABAN-c_N'];
    tableau(:, end) = [ABb; c_B'*ABb];

    x = zeros(s(2), 1);
    x(basicvars) = ABb;

    if (all(x >= 0))
        feasible = 1;

    if (all(A*x == b))
        basic = 1;

    if ((all(tableau(end, basicvars)) == 0) & ...
            (all(tableau(end, nonbasicvars) >= 0)) & feasible)
        optimal = 1;

end