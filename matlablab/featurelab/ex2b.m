load patients;

for kk=3:2:9

for run=1:5

    
[sinputs,slabels]=shufflerows(inputs,labels);

for cross=1:4

[rest, restlabels, input, inputlabels] = crossfold(cross,4,sinputs,slabels); 

for i=1:494
    c = mi(input(:,i),inputlabels);
    c1 = corrcoef(input(:,i),inputlabels);
    absolutep(1,i) = abs(c1(1,2));
    absolutemi(1,i) = abs(c);
end



[valuesmi,indexmi]=sort(absolutemi, 'descend');
[valuesp,indexp]=sort(absolutep, 'descend');


for k=1:50
    correct1=0;
    correct2=0;
    for j=1:1500
        prediction1(j,1) = knearest( kk, rest(j,indexmi(1:k)), input(:,indexmi(1:k)), inputlabels );
        prediction2(j,1) = knearest( kk, rest(j,indexp(1:k)), input(:,indexp(1:k)), inputlabels );
        
        if(prediction1(j,1) == restlabels(j))
            correct1 = correct1+1;
        end
        if(prediction2(j,1) == restlabels(j))
            correct2 = correct2+1;
        end
        
    end
    error1(cross,k) = ((1500-correct1)/1500)*100;
    error2(cross,k) = ((1500-correct2)/1500)*100;
end

end

runerror1(run,:) = mean(error1);
runerror2(run,:) = mean(error2);
end


mean1 = mean(runerror1);
mean2 = mean(runerror2);
stddev1 = std(runerror1);
stddev2 = std(runerror2);

figure;
errorbar(1:50, mean1, stddev1);
title(['Error vs Number of features for mutual exclusion for k = ' num2str(kk)]);
xlabel('Number of Features');
ylabel('Error(%)');
figure;
errorbar(1:50, mean2, stddev2);
title(['Error vs Number of features for pearsons coefficient for k = ' num2str(kk)]);
xlabel('Number of Features');
ylabel('Error(%)');

end