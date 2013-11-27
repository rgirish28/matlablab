clear;
load digdata;
ctr =0;
mean1=zeros(10,256);
for j=500:500:5000
    ctr = ctr+1;
    mean1(ctr,:) = mean(data(j-499:j,:));
end


        