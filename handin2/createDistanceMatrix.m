function [D] = createDistanceMatrix(N, distanceLimit)
%CREATEDISTANCEMATRIX Summary of this function goes here
%   Detailed explanation goes here
    D = randi(distanceLimit, N);
    for i = 1:N
        D(i, i) = 0;
        D(:, i) = D(i, :)';
    end
    
end