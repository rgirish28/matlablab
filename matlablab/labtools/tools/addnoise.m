% function data = addnoise (data, fraction)
% Adds a percentage of noise to the provided digit data.
%
% Usage:  data = addnoise (data, 0.1);
% (adds 10% noise to the data)
%
function data = addnoise (data, fraction)


%decide randomly which pixels we're going to add noise to
x = randperm(numel(data));
x = x(1:(numel(data)*fraction));

%change those pixels to random ones from 0-255
data(x) = ceil(rand*255);
