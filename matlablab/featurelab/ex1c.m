load patients;

[inputs1,labels1] = shufflerows(inputs,labels);
[rest, restlabels, input, inputlabels] = crossfold(1,4,inputs1,labels1); 

for i=1:494
    c = mi(input(:,i),inputlabels);
    absolute(1,i) = abs(c);
    c1 = corrcoef(input(:,i),inputlabels);
    absolute1(1,i) = abs(c1(1,2));
end

[values,index]=sort(absolute, 'descend');
[values1,index1]=sort(absolute1, 'descend');

disp(['The features which are most important for MI are: ' num2str(index(1:5))]);
disp(['The features which are most important for Pearsons coefficient are: ' num2str(index1(1:5))]);


bar(1:494, absolute);
title('Absolute Values of Mutual Information for the different features');
xlabel('Feature Number');
ylabel('Mutual Information');

figure;

bar(1:494, absolute1);
title('Absolute Values of Pearsons Coefficient for the different features');
xlabel('Feature Number');
ylabel('Pearsons Coefficient');