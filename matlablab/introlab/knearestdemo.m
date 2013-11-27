%LOAD DATA
load dataa;

%CHOOSE A VALUE FOR 'k'
k=1;

% RUN THE KNN USING ALL THE DATA
% SEE IF YOU CAN ADAPT THIS TO SPLIT THE DATA INTO TRAIN/TEST SETS
%
% HINT: USE THE 'CROSSFOLD' AND 'SHUFFLEROWS' COMMANDS
%
correct = 0;
for n=1:size(inputs,1)

  prediction = knearest( k, inputs(n,:), inputs, labels );

  if prediction == labels(n)
    correct = correct + 1; 
  end

end


disp( [ 'K-NN with k=' num2str(k) ' has accuracy of ' num2str(correct) '/' num2str(n) ] );

disp( 'Now drawing the boundary... (this may take some time)' );

drawknearestboundary( k, inputs, labels );
