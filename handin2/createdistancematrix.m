function [D] = createdistancematrix(N, distanceLimit)
%CREATEDISTANCEMATRIX creates a symmetric distance matrix, given
% the N number of cities and a distance limit distanceLimit between
% any two cities.

    % Works, but draws too many random integers.
%     D = randi(distanceLimit, N);
%     for i = 1:N
%         D(i, i) = 0;
%         D(:, i) = D(i, :)';
%     end

    % This generates only the actual needed amount of random integers.
%    D = triu(ones(N), 1);
%    D(D > 0) = randi(distanceLimit, N*(N-1)/2, 1);
%    D = D + D';

    % And this creates a distance matrix that can actually be realized in
    % Euclidean norm.
    coordinates = randi(distanceLimit, 2, N);
    D = zeros(N, N);
    for i = 1:(N-1)
        for j = (i+1):N
            D(i, j) = norm(coordinates(:, i)-coordinates(:, j));
        end
    end
    D = D + D';

end