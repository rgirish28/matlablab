clear;
load digdata;

for j=0.1:0.1:1

true = 0;

data = double(addnoise(data,j));

[inputs, inputlabels] = shufflerows(data,labels);

for(i=1:5000)
    prediction = knearest(3,double(data(i,:)),double(inputs),inputlabels);
  
    if(prediction == labels(i))
        true = true+1;
    end
    
end

accuracy(round(j*10)) = (true/5000)*100;

end
