function X=branchy(x,N);
% function X=branchy(x,N);
% returns the mx(n+1) matrix X where
% each row of X is a possible extension
% of the input path x.
% x is a 1xn vector, and N is the total number
% of cities in the problem.
    
%    X = zeros(N-length(x), length(x)+1);

%    xtemp = 1:N;
%    xtemp(x) = [];
    X = [repmat(x, N-length(x), 1) setdiff(1:N, x)'];
    
%    for i = 1:length(xtemp)
%        X(i, :) = [x xtemp(i)];
%    end
    
end