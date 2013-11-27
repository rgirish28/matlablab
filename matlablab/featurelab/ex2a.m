load patients;

for cross = 1:4

[rest, restlabels, input, inputlabels] = crossfold(cross,4,inputs,labels); 

for i=1:494
    c = mi(input(:,i),inputlabels);
    c1 = corrcoef(input(:,i),inputlabels);
    absolutep(1,i) = abs(c1(1,2));
    absolutemi(1,i) = abs(c);
end



[valuesmi,indexmi]=sort(absolutemi, 'descend');
[valuesp,indexp]=sort(absolutep, 'descend');


for k=1:50
    correct=0;
    for j=1:1500
        prediction(j,1) = knearest( 1, rest(j,indexmi(1:k)), input(:,indexmi(1:k)), inputlabels );
        
        if(prediction(j,1) == restlabels(j))
            correct = correct+1;
        end
    end
    error1(cross,k) = (1500-correct)/1500;
end

for k=1:50
    correct=0;
    for j=1:1500
        prediction(j,1) = knearest( 1, rest(j,indexp(1:k)), input(:,indexp(1:k)), inputlabels );
        
        if(prediction(j,1) == restlabels(j))
            correct = correct+1;
        end
    end
    error2(cross,k) = (1500-correct)/1500;
end

end

finalerror1 = mean(error1);
finalerror2 = mean(error2);

bar(1:50,finalerror1);
title('Plot of error vs number of features for mutual information');
xlabel('Number of Features');
ylabel('Error');

figure;

bar(1:50,finalerror2);
title('Plot of error vs number of features for Pearsons coefficient');
xlabel('Number of Features');
ylabel('Error');