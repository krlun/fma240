% the variable d determines the size of the problem.
if ~exist('d');
  d=7; 
end;

% Create A, b and c matrices according to
% equation (8.2) on page 168 in Papademitriou-Steiglitz
A=zeros(2*d,3*d);
b=zeros(2*d,1);
c=zeros(3*d,1);
A=[4*eye(d) -4*eye(d) zeros(d,d);4*eye(d) zeros(d,d) 4*eye(d)];
b=[zeros(d,1); 4*ones(d,1)];
c(d)=1;
b(1)=1;
A(1:d,1:d) = A(1:d,1:d) + diag(-ones(d-1,1),-1);
A(d+(1:d),1:d) = A(d+(1:d),1:d) + diag(ones(d-1,1),-1);

% Permute the variables
perm=[(d+1):(2*d);(2*d+1):(3*d)];
perm=perm(:);
perm=[1:d perm'];
A=A(:,perm);
c=c(perm);
c=-c;

% Setup simplex tableau
y=[A b;c' 0];

% Choose initial basic variables.
basicvars=[1:d (d+2):2:(3*d-2) (3*d-1)];

clear perm y

