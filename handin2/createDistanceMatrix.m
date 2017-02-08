function [D] = createDistanceMatrix(N, distanceLimit)
%CREATEDISTANCEMATRIX Summary of this function goes here
%   Detailed explanation goes here

    %fungerar
%     D = randi(distanceLimit, N);
%     for i = 1:N
%         D(i, i) = 0;
%         D(:, i) = D(i, :)';
%     end

    %genererar bara de slumptal som faktiskt beh?vs
    D = triu(ones(N), 1);
    D(D > 0) = randi(distanceLimit, N*(N-1)/2, 1);
    D = D + D';

end