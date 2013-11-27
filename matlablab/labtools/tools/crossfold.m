% CROSSFOLD allows you to partition your data into several train/test splits, also known as 'folds'.
%
% [traindata, trainlabels, testdata, testlabels] = CROSSFOLD( fold, numfolds, data, datalabels )
%
% Arguments:
%   fold - which fold you want, out of 'numfolds'.
%   numfolds - total number of folds you want to make.
%   data - the data
%   datalabels - the data labels
%
% Example:
% I want to do a 5-fold cross validation, assuming I have variables 'data' and
% 'datalabels' already created, I type:
%
%    [trdata trlabels tedata telabels] = crossfold( 1, 5, data, datalabels );
%
% to get the first train/test split.
%
%    [trdata trlabels tedata telabels] = crossfold( 4, 5, data, datalabels );
%
% to get the fourth split.
%
%
%
function [traindata, trainlabels, testdata, testlabels] = crossfold( fold, numfolds, data, datalabels )

%take note of how many features (columns) we have
numfeatures = size(data,2);

%join the data and the labels up to make this easier
data = [data datalabels];

%calculate how big each fold (data partition) will be
foldsize = round( size(data,1) / numfolds );

%calculate the matrix indices for the start/end of the partitions
startindex = (fold-1)*foldsize+1;
endindex   = (fold-1)*foldsize+foldsize;

%boundary condition
if fold==numfolds
    endindex = size(data,1);
end

%find the test data rows
testindices = startindex:endindex;
%everything else is training data
trainindices = [ (1:startindex-1) (endindex+1):size(data,1) ];

%split it
traindata = data(trainindices,:);
testdata  = data(testindices,:);

%split off the data from the data labels
trainlabels = traindata(:,numfeatures+1);
traindata(:,numfeatures+1) = [];
testlabels = testdata(:,numfeatures+1);
testdata(:,numfeatures+1) = [];





