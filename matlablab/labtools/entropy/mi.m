function H = mi(x,y)
%
%  mi(x,y)
%
%     Calculates the mutual information between random variables x and y.
%     x and y must both be single column vectors.
%     Example:
%
%     >> x = [1 1 1 0 1 1 0 1 1 1]';
%     >> y = [1 1 1 1 0 0 1 0 0 1];
%     >> mi(x,y)
%
%      ans =
%
%          0.1710
%
%     >> mi(x,x)
%
%      ans = 
%
%          0.7219
%
%     Note that this returns in base 2.
%     The upper bound on mi(x,y) is min( h(x), h(y) )
%   
%     See also
%     H
%
H = mutualinfo( x,y );
