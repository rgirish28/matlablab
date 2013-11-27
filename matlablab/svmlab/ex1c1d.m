load heart;
traccu = [0,0,0,0,0,0,0,0,0,0];
teaccu = [0,0,0,0,0,0,0,0,0,0];
traccucross = 0;
tic;
for(i=1:10)

[data, datalabels] = shufflerows(inputs,labels);

for(j=1:5)

[trdata,trdatalabels, tedata,tedatalabels] = crossfold(j,5,data, datalabels);

model = svmtrain(trdatalabels, trdata,'-t 0');

[trlabels, traccuracy, trprob] = svmpredict(trdatalabels, trdata, model);

traccucross = traccucross+traccuracy(1); 

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

teaccu(i)= teaccuracy(1);
end
toc;
disp(['Average Time over 10 runs: ' num2str(toc/10)]);
meantr = mean(traccu);
meante = mean(teaccu);
stdtr = std(traccu);
stdte = std(teaccu);
disp(['Mean Training Accuracy: ' num2str(meantr)] );
disp(['Mean Testing Accuracy: ' num2str(meante)] );
disp(['Standard Deviation of Training Data: ' num2str(stdtr)] );
disp(['Standard Deviation of Testing Data: ' num2str(stdte)] );
