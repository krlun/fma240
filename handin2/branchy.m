function X=branchy(x,N);
% function X=branchy(x,N);
% returns the mx(n+1) matrix X where
% each row of X is a possible extension
% of the input path x.
% x is a 1xn vector, and N is the total number
% of cities in the problem.

     % Enumerate all cities 1 -> N, unset visited cities.
     RemainingCities = 1:N;
     RemainingCities(x) = [];

     % Set variables for row repetition.
     num_remaining = N-length(x);
     rep_col = 1; % Constrain repetition to one column.

     % Repeat current path num_remaining times, append remaining cities.
     X = [repmat(x, num_remaining, rep_col) RemainingCities'];

     % One liner, slow because of setdiff.
%     X = [repmat(x, N-length(x), 1) setdiff(1:N, x)'];

end
