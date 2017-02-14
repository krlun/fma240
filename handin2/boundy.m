function bounds=boundy(x,D,minmax);
% function bounds=boundy(x,D,minmax);
% calculates the 1x2 vector with lower and upper bound
% respectively,
% given the 1xn vector with the current path,
% the NxN distance matrix D and the Nx2 matrix
% minmax, where minmax(i,1) is the minimum distance
% from city i and minmax(i,2) is the maximum distance
% from city i.

    % Get the number of cities.
    [~, N] = size(D);

    % remaining_cities on one line, slower because of setdiff.
%    remaining_cities = setdiff(1:N, x);

    % Enumerate cities, unset cities already in path.
    remaining_cities = 1:N;
    remaining_cities(x) = [];

%    distance_traveled = 0;
%    for i = 2:length(path)
%        distance_traveled = distance_traveled + D(x(i-1), x(i));
%    end

    % Calculate traveled distance and remaining min/max distances.
    sum_dim = 1; % Force the summation into a vector.
    remaining_minmax = sum(minmax(remaining_cities, :), sum_dim);
    current_distance = sum(diag(D(x(1:end-1), x(2:end))));

    bounds = remaining_minmax + current_distance;

    if (length(x) == N)
        % Visited all cities, add return length.
        bounds = bounds + D(x(end), x(1));
    else % Haven't reached the end, add minmax for last visit.
        bounds = bounds + minmax(x(end), :);
    end
end
