function h = entropy(vec1)

% entropy(x)
%
% 	Calculate the entropy of the random variable x.
%       x must be a single column vector.
%       Example:
%      
%       >> x = [ 1 1 1 1 1 1 ]';
%       >> entropy(x)
%
%         ans = 
%
%            0
%
%       >> x = [ 1 1 1 0 0 0 ]';
%       >> entropy(x)
%
%         ans =
%
%            1
%
if nargin<1,

  disp('Usage: h = entropy(vec1).');
  h = -1;

else,

  [p1] = estpa(vec1);
  h = estentropy(p1);  %return in base 2
  %h = estentropy(p1)  / log2(exp(1)); % return in base e

end;


