%
% [SHUFFLEDDATA, SHUFFLEDDATALABELS] = SHUFFLEROWS( DATA, DATALABELS )
%
% Shuffles the data you provide.
% HINT: set the random number seed with:
%
%     rand('state', seed)
%
% to allow reproduciblity of experimental results.
%
function [shuffleddata, shuffleddatalabels] = shufflerows( data, datalabels )


permutation = randperm( size(data,1) );

shuffleddata = data(permutation, :);
shuffleddatalabels = datalabels(permutation, :);

