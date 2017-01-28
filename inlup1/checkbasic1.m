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

    A_B = A(:, [basicvars]);
    A_N = A;
    A_N(:, [basicvars]) = [];
    c_B = c([basicvars]);
    c_N = c;
    c_N([basicvars]) = [];

    s = size(A);
    tableau = zeros(s(1)+1, s(2)+1);
    for i = 1:length(basicvars)
        tableau(i, basicvars(i)) = 1;
    end
    
    temp_tableau = inv(A_B)*A_N;
    bottomleft = c_B'*inv(A_B)*A_N-c_N';
    index = 1:s(2);
    index([basicvars]) = [];
    j = 1;
    for i = index
        tableau(1:end-1, i) = temp_tableau(:, j);
        tableau(end, i) = bottomleft(j);
        j = j + 1;
    end
    tableau(1:end-1, end) = inv(A_B)*b;
    tableau(end, end) = c_B'*inv(A_B)*b;

%    tableau = [inv(A_B)*A_N eye(length(basicvars)) inv(A_B)*b; ...
%        c_B'*inv(A_B)*A_N-c_N' zeros(1, length(basicvars)), c_B'*inv(A_B)*b]

    if (bottomleft >= 0)
        optimal = 1;
    else
        optimal = 0;
    end
    
    x = zeros(s(2), 1);
    x_B = inv(A_B)*b;
    
    for i = 1:length(basicvars)
        x(basicvars(i)) = x_B(i);
    end
    
    if (x >= 0)
        feasible = 1;
    else
        feasible = 0;
    end
    
    basic = 0;

end