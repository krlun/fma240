% Sawmill example
%A = [2 2 1 0; 5 3 0 1];
%b = [8; 15];
%c = [120; 100; 0; 0];
%basicvars = [3 4];

% Two phase example
% Phase 1:
%A = [1 2 2 1 1 0 1 0 0; 1 2 1 1 2 1 0 1 0; 3 6 2 1 3 0 0 0 1];
%b = [12; 18; 24];
%c = [0; 0; 0; 0; 0; 0; -1; -1; -1];
%basicvars = [7 8 9];

% Phase 2:
%A = [1 2 2 1 1 0; 1 2 1 1 2 1; 3 6 2 1 3 0];
%c = [1; -2; -3; -1; -1; 2];

% Problem 5:
%A = [2 -3 2 1 0; -1 1 1 0 1];
%b = [3; 5];
%c = [3; 2; 1; 0; 0];
%basicvars = [4 5];


function [tableau, x, basic, feasible, optimal] = simplex(A, b, c, basicvars);
    [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
    tableau

    while (~optimal)
        [~, entering] = min(tableau(end, 1:end-1));
        theta = tableau(1:end-1, end)./tableau(1:end-1, entering);
        if (max(theta) <= 0)
            disp('No finite optimum exists.');
            break;
        end
        theta(theta <= 0) = Inf;

        [~, departing] = min(theta);
        basicvars(departing) = entering;
        [tableau, x, basic, feasible, optimal] = checkbasic1(A, b, c, basicvars);
        tableau
    end

end