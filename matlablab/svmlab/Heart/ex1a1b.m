load heart;
traccu = [0,0,0,0,0,0,0,0,0,0];
teaccu = [0,0,0,0,0,0,0,0,0,0];
telapsed = 0;
for i=1:10 
    tstart = tic;
    [data, datalabels] = shufflerows(inputs,labels);

    [trdata,trdatalabels, tedata,tedatalabels] = crossfold(1,2,data, datalabels);

    model = svmtrain(trdatalabels, trdata,'-t 0');

    telapsed = telapsed+ toc(tstart);

    [trlabels, traccuracy, trprob] = svmpredict(trdatalabels, trdata, model);

    traccu(i) = traccuracy(1); 

    [telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

    teaccu(i)= teaccuracy(1);
end

disp(['Average Training Time over 10 runs: ' num2str(telapsed/10)]);

disp(['Training Accuracy for the 10 runs: ' num2str(traccu) ]);

disp(['Testing Accuracy for the 10 runs: ' num2str(teaccu) ]);

meantr = mean(traccu);

meante = mean(teaccu);

stdtr = std(traccu);

stdte = std(teaccu);

disp(['Mean Training Accuracy: ' num2str(meantr)] );

disp(['Mean Testing Accuracy: ' num2str(meante)] );

disp(['Standard Deviation of Training Data: ' num2str(stdtr)] );

disp(['Standard Deviation of Testing Data: ' num2str(stdte)] );

