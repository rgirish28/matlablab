function H = h(varargin)
% h(x)
%
% 	  Calculate the entropy of the random variable x.
%     x must be a single column vector.
%     Example:      
%     >> x = [ 1 1 1 1 1 1 ]';
%     >> h(x)
%
%       ans = 
%
%          0
%
%     >> x = [ 1 1 1 0 0 0 ]';
%     >> h(x)
%
%       ans =
%
%          1
%
%     See also
%     MI
if nargin==1

	x = cell2mat(varargin(1));
	H = entropy( x );

else

	x = cell2mat(varargin(1));
	y = cell2mat(varargin(2));

    H = jointentropy( x,y );
    
end

