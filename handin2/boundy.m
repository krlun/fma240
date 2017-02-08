function bounds=boundy(x,D,minmax);
% function bounds=boundy(x,D,minmax);
% calculates the 1x2 vector with lower and upper bound
% respectively,
% given the 1xn vector with the current path,
% the NxN distance matrix D and the Nx2 matrix
% minmax, where minmax(i,1) is the minimum distance
% from city i and minmax(i,2) is the maximum distance
% from city i.

%    bounds = zeros(1, 2);
    [~, N] = size(D);
    
    %fungerar och ?r r?tt snabbt
     remainingCities = 1:N;
     remainingCities(x) = [];

    %oneliner, men l?ngsam p? grund av setdiff
%    remainingCities = setdiff(1:N, x);

%    distanceTraveled = 0;
%    for i = 2:length(x)
%        distanceTraveled = distanceTraveled + D(x(i-1), x(i));
%    end

    bounds = sum(minmax(remainingCities, :), 1) + ...
        sum(diag(D(x(1:end-1), x(2:end))));
    
    if (length(x) == N)
        bounds = bounds + D(x(end), x(1));
    else
        bounds = bounds + minmax(x(end), :);
    end

%     bounds(1) = distanceTraveled;
%     bounds(2) = distanceTraveled;
%     
%     if (length(x) == N)
%         bounds(1) = bounds(1) + D(x(end), x(1));
%         bounds(2) = bounds(2) + D(x(end), x(1));
%     else
%         bounds(1) = bounds(1) + minmax(x(end), 1);
%         bounds(2) = bounds(2) + minmax(x(end), 2);
%         for i = 1:length(remainingCities)
%             bounds(1) = bounds(1) + minmax(remainingCities(i), 1);
%             bounds(2) = bounds(2) + minmax(remainingCities(i), 2);
%         end
%     end

end