load heart;
traccu = [0,0,0,0,0,0,0,0,0,0];
teaccu = [0,0,0,0,0,0,0,0,0,0];
telapsed = 0;

for(i=1:10)
    
traccucross = 0;
teaccucross = 0;

[data, datalabels] = shufflerows(inputs,labels);

for(j=1:5)

[tedata,tedatalabels, tedata,tedatalabels] = crossfold(j,5,data, datalabels);
tstart = tic;
model = svmtrain(trdatalabels, trdata,'-t 0');
telapsed = telapsed+toc(tstart);
[trlabels, traccuracy, trprob] = svmpredict(trdatalabels, trdata, model);


traccucross = traccucross + traccuracy(1); 

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

teaccucross= teaccucross + teaccuracy(1);

end
teaccu(i) = teaccucross/5;
traccu(i) = traccucross/5;

end

disp(['Average Training Time over 50 runs: ' num2str(telapsed/50)]);
meantr = mean(traccu);
meante = mean(teaccu);
stdtr = std(traccu);
stdte = std(teaccu);
disp(['Mean Training Accuracy: ' num2str(meantr)] );
disp(['Mean Testing Accuracy: ' num2str(meante)] );
disp(['Standard Deviation of Training Data: ' num2str(stdtr)] );
disp(['Standard Deviation of Testing Data: ' num2str(stdte)] );
