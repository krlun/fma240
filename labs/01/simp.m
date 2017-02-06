function [tableau, x, basic, feasible, optimal, time, count] = simp(A, b, c, basicvars);
    tic
    [tableau, x, basic, feasible, optimal] = checkbasic(A, b, c, basicvars);
    %tableau
    count = 0;
    while (~optimal)
        [~, entering] = min(tableau(end, 1:end-1));
        theta = tableau(1:end-1, end)./tableau(1:end-1, entering);
        theta(theta <= 0) = Inf;
        [~, departing] = min(theta);
        if ((max(tableau(1:end-1, entering)) <= 0) || departing == Inf)
            disp('No finite optimum exists.');
            break;
        end

        basicvars(departing) = entering;
        [tableau, x, basic, feasible, optimal] = checkbasic(A, b, c, basicvars);
        %tableau
        count = count + 1;
    end
    %basicvars
    
    time = toc
end