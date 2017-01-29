% Script for testing the sawmill problem
%A = [2 2 1 0; 5 3 0 1];
%b = [8; 15];
%c = [120; 100; 0; 0];
%basicvars = [3 4];
optimal = 0;

A = [1 -1 -1 0 1 0 0; -2 5 -3 -3 0 1 0; 2 -5 0 3 0 0 1];
b = [2; 10; 5];
c = [2; 3; 1; 1; 0; 0; 0];
basicvars = [5 6 7];

disp('Sawmill');
tableau

g = 0;
while (~optimal)% && g < 10)
    g = g + 1;
    [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
    pivot = zeros(1, 2);
    [Y, pivot(2)] = min(tableau(end, 1:end-1));
%   det h?r ?r verkligen inte vackert...
    temp_pivot_1 = tableau(1:end-1, end)./tableau(1:end-1, pivot(2));
    for i = 1:length(temp_pivot_1)
        if (temp_pivot_1(i) < 0)
            temp_pivot_1(i) = Inf;
        end
    end
%    [Y, pivot(1)] = min(tableau(1:end-1, end)./tableau(1:end-1, pivot(2)));
    [Y, pivot(1)] = min(temp_pivot_1);
    if (tableau(1:end-1, pivot(2) <= 0))
        disp('No finite optimum exists.')
        break;
    end
    
    tableau(pivot(1), :) = 1/tableau(pivot(1), pivot(2))*tableau(pivot(1), :);
    s = size(tableau);
    index = 1:s(1);
    index(pivot(1)) = [];
    for i = index
        tableau(i, :) = tableau(i, :) - tableau(i, pivot(2))*tableau(pivot(1), :);
    end
    
    basicvars = zeros(1, length(basicvars));
    for i = 1:length(basicvars)
        for j = 1:s(2)-1
            if (tableau(i, j) == 1)
                basicvars(i) = j;
            end
        end
    end
    tableau
end