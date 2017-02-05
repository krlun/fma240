function [tableau,basicvars,steps]=simpb(A,b,c,basicvars)
% [y,basicvars,steps] = simpb(A,b,c,basicvars)
%
% A    m*n-matrix
% b    m*1-matrix, b>=0
% c    n*1-matrix
% basicvars 1*m - matrix with indices for feasible basic variables.
%
% Simplex method for a 'Bland' like choice of entering
% basic variable 
% on the problem 
%                   max(c'x), when Ax=b, x>=0.
% 

[m,n]=size(A);

% Create a tableau with slack variables
[tableau,x,basic,feasible,optimal]=checkbasic(A,b,c,basicvars);

steps=0;
tol = 100*eps;
% Loop until all reduced costs are non-negative
while min(tableau(m+1,1:n)) < -tol
	steps=steps+1;
	
	%  input pivot indices (p,q)   
	negind=find(tableau(m+1,1:n)<-tol);
	% Select the first negative entry as pivot column.
	q=negind(1); 
	
	pospiv=find(tableau(1:m,q)>0);
	if ~isempty(pospiv)
		[mintheta,pospivindex]=min(tableau(pospiv,n+1)./tableau(pospiv,q));
		ind=pospiv(pospivindex);
		% Found pivot element at row p column q.
		p = basicvars(ind);
	else
		error('Unbounded problem');
	end;
   
	basicvars = union(basicvars, q);
	basicvars = setdiff(basicvars, p);

	% Compute new tableau with the new basic variables
	[tableau,x,basic,feasible,optimal]=checkbasic(A,b,c,basicvars);

	if ~feasible
		error('Incorrect pivot element');
	end
end
