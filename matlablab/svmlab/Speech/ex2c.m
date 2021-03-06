load speech;

totaltime = 0;

for g=1:5

for(c=0:3)

for(i=1:10)
    
[data, datalabels] = shufflerows(inputs,labels);
    
for(j=1:5)

[trdata,trdatalabels,tedata, tedatalabels] = crossfold(j,5,data, datalabels);
tstart = tic;

model = svmtrain(trdatalabels, trdata,['-t 2 -g ' num2str(g), ' -c ' num2str(10^c)]);
totaltime = totaltime+toc(tstart);

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

tevalues(i,j) = teaccuracy(1);
end

temean(g,c+1) = mean2(tevalues);

end
end
end

y=[1,10,100,1000];

surf(0:3,1:5,temean);
title('\it{Testing Accuracy vs Kernel Width vs Penalty Parameter}','FontSize',16);
xlabel('Penalty Parameter(C) as log base 10 values');
ylabel('Kernel Width Parameter, Gamma');
zlabel('Testing Accuracy');