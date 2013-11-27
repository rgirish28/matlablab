%
% EXTRACTFEATURES( digdata )
%
% Assumes the single argument is a 1x256 row vector.
% This function reshapes it into a 16x16 digit,
% averages the columns, and returns it as a 1x16 row vector.
function f = extractfeatures( x )

%turn it into a 16x16 matrix
dig = reshape( x, 16, 16 );

%average the values in along matrix dimension 1 (rows)
f = round( mean(dig,1) );
