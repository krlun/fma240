function X=branchy(x,N);
% function X=branchy(x,N);
% returns the mx(n+1) matrix X where
% each row of X is a possible extension
% of the input path x.
% x is a 1xn vector, and N is the total number
% of cities in the problem.

%     %snabbare
%     remainingCities = 1:N;
%     remainingCities(x) = [];
%     X = [repmat(x, N-length(x), 1) remainingCities'];

    %oneliner, men l?ngsam p? grund av setdiff
    X = [repmat(x, N-length(x), 1) setdiff(1:N, x)'];
    
end