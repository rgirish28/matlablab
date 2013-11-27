load heart;

totaltime = 0;

for(c=0:3)

for(i=1:10)
    
[data, datalabels] = shufflerows(inputs,labels);
    
for(j=1:5)

[trdata,trdatalabels,tedata, tedatalabels] = crossfold(j,5,data, datalabels);
tstart = tic;
model = svmtrain(trdatalabels, trdata,['-t 2 -g 1 -c ' num2str(10^c)]);
totaltime = totaltime+toc(tstart);

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

te(j) = teaccuracy(1);
tevalues(i,j) = teaccuracy(1);
end

temean(c+1,i) = mean(te);

end
finaltemean(c+1) = mean(temean(c+1));
testd(c+1) = std2(tevalues);
end


errorbar(1:1000,finaltemean,testd);
title('\it{Testing Accuracy against Kernel Width}','FontSize',16);
xlabel('Kernel Width');
ylabel('Testing Accuracy');

disp(['Average Training Time over 250 runs: ' num2str(totaltime/250)]);