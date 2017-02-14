function X=branchy(curr_path,N);
% function X=branchy(curr_path,N);
% returns the mx(n+1) matrix X where
% each row of X is a possible extension
% of the input path curr_path.
% path is a 1xn vector, and N is the total number
% of cities in the problem.

     % Enumerate all cities 1 -> N, unset visited cities.
     remainingCities = 1:N;
     remainingCities(curr_path) = [];

     % Set variables for row repetition.
     num_remaining = N-length(curr_path);
     rep_col = 1; % Constrain repetition to one column.

     % Repeat current path num_remaining times.
     X = [repmat(curr_path, num_remaining, rep_col)];
     % Append remaining cities.
     X = [X remainingCities'];

%    oneliner, men långsam på grund av setdiff.
%    X = [repmat(x, N-length(x), 1) setdiff(1:N, x)'];

end
