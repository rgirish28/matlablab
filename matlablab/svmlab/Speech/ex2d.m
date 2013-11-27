load speech;

fn=0;
tp=0;
totaltime = 0;

for g=1:5

    for(c=0:3)

        for(i=1:10)
    
        [data, datalabels] = shufflerows(inputs,labels);
    
            for(j=1:5)

                tp=0;
                fn=0;
                
                [trdata,trdatalabels,tedata, tedatalabels] = crossfold(j,5,data, datalabels);
                tstart = tic;

model = svmtrain(trdatalabels, trdata,['-t 2 -g ' num2str(g), ' -c ' num2str(10^c)]);
totaltime = totaltime+toc(tstart);

[telabels, teaccuracy, teprob] = svmpredict(tedatalabels, tedata, model);

for(b=1:54)
    if ((telabels(b)==1) && (tedatalabels(b)==2))
        fn=fn+1;
    elseif ((telabels(b)==2) && (tedatalabels(b)==2))
        tp=tp+1;
    else
        continue;
    end
end

if (tp+fn==0)
    tsensitivity(i,j)=0;
else
    tsensitivity(i,j) = tp/(tp+fn);
end

end

temean(g,c+1) = mean2(tsensitivity);

end
end
end



surf(0:3,1:5,temean);
title('\it{Sensitivity vs Kernel Width vs Penalty Parameter}','FontSize',16);
xlabel('Penalty Parameter(C) as log base 10 values');
ylabel('Kernel Width Parameter, Gamma');
zlabel('Sensitivity');
