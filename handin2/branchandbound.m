function [x,fopt]=branchandbound(x,D,minmax,fopt);

% Get dimensions of distance matrix.
[rows,~]=size(D);

% Calculate bounds.
bounds=boundy(x,D,minmax);

% Index helper variables.
imin = 1;
imax = 2;

% Check bounds for equality.
if bounds(imin) == bounds(imax),

   if bounds(imin)<fopt,
      % Bound is better then current opt.
      fopt=bounds(imin);
   end

else % Min and max bound are not equal.

   % Get possible candidates.
   candidates=branchy(x,rows);
   [candidate_rows, ~] = size(candidates);

   % Calculate bounds for all candidates and store in B.
   B=zeros(candidate_rows,2);
   for iii=1:candidate_rows,
      B(iii,:)=boundy(candidates(iii,:),D,minmax);
   end

   % Sort B and put candidates into same order.
   [B,sorted_order]=sortrows(B);
   candidates=candidates(sorted_order,:);

   % Iterate over all candidates and store opt path.
   for iii=1:candidate_rows,
     if B(iii,imin)<fopt,
         % Current minimal dist < current optimal.
         curr_row = candidates(iii,:);
         [x_new,fopt_new]=branchandbound(curr_row,D,minmax,fopt);
         if fopt_new<fopt,
            fopt=fopt_new;
            x=x_new;
         end
      end
   end
end
