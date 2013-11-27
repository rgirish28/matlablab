% DRAWKNEARESTBOUNDARY ( K, DATA , LABELS )
%
% Draws the decision boundary formed by the knn classifier
%  after training on the supplied data matrix.
%
% DATA is assumed to be an NxM matrix of N examples, M features.
% LABELS should be a Nx1 matrix, of digits 1 or 2.
%
% Note: Uses only the first two dimensions of the INPUTS matrix.
%
function drawknearestboundary( k, data, labels )


%FIRST PLOT THE DATA
scatter(data(labels==1, 1), data(labels==1, 2), 'bo');
hold on;
scatter(data(labels==2, 1), data(labels==2, 2), 'rx');

%NOW THE BOUNDARY
mn = 1.2*min( min(data(:,1)), min(data(:,2)) );
mx = 1.2*max( max(data(:,1)), max(data(:,2)) );
axis([ mn mx mn mx ]);
x = mn:(mx-mn)/100:mx;
y = mn:(mx-mn)/100:mx;

[X, Y] = meshgrid(x,y);
X = X(:); Y = Y(:);
datagrid = [X Y];


for n=1:size(datagrid,1)
	Z(n) = knearest( k, datagrid(n,:), data, labels );
end

Z = reshape(Z, length(x), length(y));
[c, h] = contour(x, y, Z, 1, 'k'); %DRAW THE BOUNDARY
title(['K-nearest Neighbour, k=' num2str(k)]);
set(h, 'linewidth', 1);
