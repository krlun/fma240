function [x,cost]=transport(s,d,c);
% [x,cost]=transport(s,d,c)
% Input:
%   s = supplies         (m*1)
%   d = demands          (n*1)
%   c = costs            (m*n)
% Output:
%   x = optimal solution (m*n)
%   cost = minimal transport cost

[x, b] = northwest(s, d);
while true
    [u, v] = multipliers(x, c, b);
    r = c - u*ones(size(v')) - ones(size(u))*v';
    [I, J] = find(r<0);
    if (~isempty(I))
        i = I(1);
        j = J(1);
    else
        disp('Optimal flow found:');
        %[x s;d' 0]
        %c(c == Inf) = 0;
        cost = sum(sum(c.*x));
        break;
    end
    [x,b]=cycle(x,i,j,b);
end
