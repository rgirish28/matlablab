load heart;

totaltime = 0;

for(g=1:5)

for(i=1:10)
    
[data, datalabels] = shufflerows(inputs,labels);
    
for(j=1:5)

[trdata,trdatalabels,tedata, tedatalabels] = crossfold(j,5,data, datalabels);
tstart = tic;
model = svmtrain(trdatalabels, trdata,['-t 2 -g ' num2str(g)]);
totaltime = totaltime+toc(tstart);

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

te(j) = teaccuracy(1);
tevalues(i,j) = teaccuracy(1);
end

temean(g,i) = mean(te);

end
finaltemean(g) = mean(temean(g));
testd(g) = std2(tevalues);
end


errorbar(1:5,finaltemean,testd);
title('\it{Testing Accuracy against Kernel Width}','FontSize',16);
xlabel('Kernel Width');
ylabel('Testing Accuracy');

disp(['Average Training Time over 250 runs: ' num2str(totaltime/250)]);
