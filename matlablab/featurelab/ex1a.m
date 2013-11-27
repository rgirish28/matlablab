load patients;

for i=1:494
    c = corrcoef(inputs(:,i),labels);
    absolute(1,i) = abs(c(1,2));
end

[values,index]=sort(absolute, 'descend');

disp(['The features which are most important are: ' num2str(index(1:5))]);

bar(1:494, absolute);
title('Absolute Values of Pearsons Correlation coefficient for the different features');
xlabel('Feature Number');
ylabel('Pearsons Correlation coefficient');
