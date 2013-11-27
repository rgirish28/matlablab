load speech;

totaltime = 0;

for(c=0:3)

for(i=1:10)
    
[data, datalabels] = shufflerows(inputs,labels);
    
for(j=1:5)

[trdata,trdatalabels,tedata, tedatalabels] = crossfold(j,5,data, datalabels);
tstart = tic;
model = svmtrain(trdatalabels, trdata,['-t 2 -g 5 -c ' num2str(10^c)]);
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

disp(['The mean values of testing accuracy over values of C ' num2str(finaltemean)]);

figure
errorbar(0:3,finaltemean,testd);
title('\it{Testing Accuracy against Kernel Width}','FontSize',16);
xlabel('Penalty Parameter(C) as log base 10 values');
ylabel('Testing Accuracy');

disp(['Average Training Time over 250 runs: ' num2str(totaltime/250)]);