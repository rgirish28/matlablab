clear;
load digdata;
ctr=0;
k=3;
pc = 64;

%for p =0.1:0.1:1

%data = double(addnoise(data,p));

distance = zeros(10,500);
data1 = data(1:500,:);
data2 = data(501:1000,:);
data3 = data(1001:1500,:);
data4 = data(1501:2000,:);
data5 = data(2001:2500,:);
data6 = data(2501:3000,:);
data7 = data(3001:3500,:);
data8 = data(3501:4000,:);
data9 = data(4001:4500,:);
data0 = data(4501:5000,:);

mean1 = mean(data1);
mean2 = mean(data2);
mean3 = mean(data3);
mean4 = mean(data4);
mean5 = mean(data5);
mean6 = mean(data6);
mean7 = mean(data7);
mean8 = mean(data8);
mean9 = mean(data9);
mean0 = mean(data0);

[coefs1,scores1,variances1] = princomp(double(data1));
[coefs2,scores2,variances2] = princomp(double(data2));
[coefs3,scores3,variances3] = princomp(double(data3));
[coefs4,scores4,variances4] = princomp(double(data4));
[coefs5,scores5,variances5] = princomp(double(data5));
[coefs6,scores6,variances6] = princomp(double(data6));
[coefs7,scores7,variances7] = princomp(double(data7));
[coefs8,scores8,variances8] = princomp(double(data8));
[coefs9,scores9,variances9] = princomp(double(data9));
[coefs0,scores0,variances0] = princomp(double(data0));

percent_explained = 100*variances2/sum(variances2);

for i=1:256
    
sum1(i) = sum(percent_explained(1:i));
end

sum1(64)     

plot(1:256,sum1);
title('\fontsize{16} Total Variance explained using N principal components');
xlabel('\fontsize{16} No of Principal Components');
ylabel('\fontsize{16} Total Variance explained(%)');
%{

[input,inputlabels] = shufflerows(data, labels);

true = 0;

for k=3;


for i=1:5000
    testimage = double(input(i,:));
    testimagemean1 = testimage - mean1;
    vector1 = (coefs1(:,1:pc)'*testimagemean1')';
    
    testimagemean2 = testimage - mean2;
    vector2 = (coefs2(:,1:pc)'*testimagemean2')';
    
    testimagemean3 = testimage - mean3;
    vector3 = (coefs3(:,1:pc)'*testimagemean3')';
    
    testimagemean4 = testimage - mean4;
    vector4 = (coefs4(:,1:pc)'*testimagemean4')';
  
    testimagemean5 = testimage - mean5;
    vector5 = (coefs5(:,1:pc)'*testimagemean5')';
  
    testimagemean6 = testimage - mean6;
    vector6 = (coefs6(:,1:pc)'*testimagemean6')';
  
    testimagemean7 = testimage - mean7;
    vector7 = (coefs7(:,1:pc)'*testimagemean7')';
  
    testimagemean8 = testimage - mean8;
    vector8 = (coefs8(:,1:pc)'*testimagemean8')';
  
    testimagemean9 = testimage - mean9;
    vector9 = (coefs9(:,1:pc)'*testimagemean9')';
    
    testimagemean0 = testimage - mean0;
    vector0 = (coefs0(:,1:pc)'*testimagemean0')';
  
    for j=1:500
        distance(1,j) = sqrt(sum((double(scores1(j,1:pc)) - vector1).^2,2));
        distance(2,j) = sqrt(sum((double(scores2(j,1:pc)) - vector2).^2,2));
        distance(3,j) = sqrt(sum((double(scores3(j,1:pc)) - vector3).^2,2));
        distance(4,j) = sqrt(sum((double(scores4(j,1:pc)) - vector4).^2,2));
        distance(5,j) = sqrt(sum((double(scores5(j,1:pc)) - vector5).^2,2));
        distance(6,j) = sqrt(sum((double(scores6(j,1:pc)) - vector6).^2,2));
        distance(7,j) = sqrt(sum((double(scores7(j,1:pc)) - vector7).^2,2));
        distance(8,j) = sqrt(sum((double(scores8(j,1:pc)) - vector8).^2,2));
        distance(9,j) = sqrt(sum((double(scores9(j,1:pc)) - vector9).^2,2));
        distance(10,j) = sqrt(sum((double(scores0(j,1:pc)) - vector0).^2,2));
    end
  sorteddist = sort(distance,2);
  [topvalues, indices] = min(sorteddist,[],1);
  value = mode( indices(1:k) );
  
  if(value==10)
      value = 0;
  end
  
  if(value==inputlabels(i))
      true = true+1;
  end
  
  
end

ctr=ctr+1;

accuracy(round(p*10),ctr) = (true/5000)*100;

end

end

% error - 0.5 - 76.88
% error - 0.5 - 96.4(all 256 features)



%}



