% INIT requires the variables m and n to be specified,
% where A is an m*n-matrix.

if ~exist('m','var'), m=3; end;
if ~exist('n','var'), n=3; end;

% We want to solve the optimization problem
% maximize z=c'*x with A*x <= b, and x>=0,
A=9*rand(m,n)+1;
b=ones(m,1);
c=ones(n,1);

% Since the right hand b side of the constraints
% are positive. It is possible to select
% the slack variables as basic variables.
% Convert the problem to canonic form
% maximize z=c'*x with A*x = b, and x>=0,
[m,n]=size(A);
A=[A eye(m)];
c=[c;zeros(m,1)];
basicvars=(n+1):(m+n);

