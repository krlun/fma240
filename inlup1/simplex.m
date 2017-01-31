% Script for testing the sawmill problem
%A = [2 2 1 0; 5 3 0 1];
%b = [8; 15];
%c = [120; 100; 0; 0];
%basicvars = [3 4];
%disp('Sawmill');

function [tableau, x, basic, feasible, optimal] = simplex(A, b, c, basicvars);

%basicvars = [3 6 1];
[tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);

while (~optimal)
    s = size(tableau);
    pivot = zeros(1, 2);
    % det h?r ger Bland's regel 1)
    for i = 1:s(2)-1
        if (tableau(end, i) < 0)
            pivot(2) = i;
            break;
        end
    end

    [Y, pivot(2)] = min(tableau(end, 1:end-1)); %ifall man vill k?ra utan
%    Bland's regel

%   det h?r ?r verkligen inte vackert...
    temp_pivot_1 = tableau(1:end-1, end)./tableau(1:end-1, pivot(2));
    for i = 1:length(temp_pivot_1)
        if (temp_pivot_1(i) < 0)
            temp_pivot_1(i) = Inf;
        end
    end
    [Y, pivot(1)] = min(tableau(1:end-1, end)./tableau(1:end-1, pivot(2)));
%    [Y, pivot(1)] = min(temp_pivot_1); % det h?r ger 2) av Bland's regel, min v?ljer f?rsta elementet
    if (all(tableau(1:end-1, pivot(2)) <= 0))
        disp('No finite optimum exists.')
        break;
    end

    tableau(pivot(1), :) = 1/tableau(pivot(1), pivot(2))*tableau(pivot(1), :);

    index = 1:s(1);
    index(pivot(1)) = [];
    for i = index
        tableau(i, :) = tableau(i, :) - tableau(i, pivot(2))*tableau(pivot(1), :);
    end

    basicvars = zeros(1, length(basicvars));
    for i = 1:length(basicvars)
        for j = 1:s(2)-1
            if (tableau(i, j) == 1)
                index = 1:s(1)-1;
                index(i) = [];
                if (all(tableau(index, j) == 0))
                    basicvars(i) = j;
                    break;
                end
            end
        end
    end
    [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
end
