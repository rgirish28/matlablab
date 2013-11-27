function Weights = relief(trdata,trlabels);

p = size(trdata,2);
m= 200; % Set this whenever you want more values
Weights = zeros(1,size(trdata,2));

indexc1 = 1;
indexc2 = 1;

for i=1:size(trdata,1)
    if(trlabels(i)==1)
        datac1(indexc1,:) = trdata(i,:);
        labelsc1(indexc1,:) = trlabels(i);
        indexc1 = indexc1 + 1;
    else
        
        datac2(indexc2,:) = trdata(i,:);
        labelsc2(indexc2,:) = trlabels(i);
        indexc2 = indexc2 + 1;
    end
    
end


rand = randperm(size(trdata,1));

for j = 1:m
    
    for k = 1:size(datac1,1)
        
        diffsq = (trdata(rand(j),:)-datac1(k,:)).^2;
        eucdistc1(k) = sqrt(sum(diffsq));
    end
    
    for k = 1:size(datac2,1)
        
        diffsq = (trdata(rand(j),:)-datac2(k,:)).^2;
        eucdistc2(k) = sqrt(sum(diffsq));
    end
    
    [eucdistc1val c1pos] = sort(eucdistc1);
    [eucdistc2val c2pos] = sort(eucdistc2);
 
    
    if(trlabels(rand(j))==trlabels(c1pos(1)))
        
        nearhit = c1pos(2);
        nearmiss = c2pos(1);
        
        for f=1:size(trdata,2)
            hit = (trdata(rand(j),f)-datac1(nearhit,f))^2;
            miss = (trdata(rand(j),f)-datac2(nearmiss,f))^2;
            Weights(f) = Weights(f) + (miss-hit)/m;
        end
    else
        
        nearhit = c2pos(2);
        nearmiss = c1pos(1);
        
        for f=1:size(trdata,2)
            hit = (trdata(rand(j),f)-datac2(nearhit,f))^2;
            miss = (trdata(rand(j),f)-datac1(nearmiss,f))^2;
            Weights(f) = Weights(f) + (miss-hit)/m;
        end
    end
end

end
        
        


