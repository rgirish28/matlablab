load patients;


for i=1:494
    c = mi(inputs(:,i),labels);
    absolute(1,i) = abs(c);
end

[values,index]=sort(absolute, 'descend');

disp(['The features which are most important are: ' num2str(index(1:5))]);

bar(1:494, absolute);
title('Absolute Values of Mutual Information for the different features');
xlabel('Feature Number');
ylabel('Mutual Information');
