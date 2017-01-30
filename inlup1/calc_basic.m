% Calculate number of basic solutions and number of them that are feasible.

function [feasible_array, num_basic] = calc_basic(A, b, c, basicvars);

    [num_basic_vars, ~] = size(b);
    [~, num_variables] = size(A);

    s = num_variables
    m = num_basic_vars

    num_basic = factorial(s) / (factorial(m)*factorial(s-m));

    feasible_array = [];
    for current_basic = basicvars';
        [~, ~, basic, feasible, ~] = checkbasic1(A, b, c, current_basic);
        if feasible
            feasible_array = [current_basic, feasible_array];
        end
    end
end
