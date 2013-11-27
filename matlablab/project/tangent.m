clear;
clc;
load digdata;
ctr=0;

for k=1:size(data,2)
    
    i=ceil(k/16);
    j=k-(16*(i-1));
    
    datasmoothed(:,k)=double(data(:,k))*exp(-1*(i^2+j^2)/2);
end

[input,inputlabels] = shufflerows(datasmoothed, labels);

accu =0;

for x=1:5000
    
    for i=1:16
        for j=1:16
            k =(i-1)*16+j;
            k1=(i-2)*16+j;
            k2=(i)*16+j;
            k3=(i-1)*16+j-1;
            k4=(i-1)*16+j+1;

            if(i==1)
                k1 = (i-1)*16+j;
            end
            if(i==16)
                k2 = (i-1)*16+j;
            end
            if(j==1)
                k3 = (i-1)*16+j;
            end
            if(j==16)
                k4 = (i-1)*16+j;
            end
            
            xder(x,k) = (datasmoothed(x,k2)-datasmoothed(x,k1))/2 ;
            
            yder(x,k) = (datasmoothed(x,k4)-datasmoothed(x,k3))/2 ;
            
             
            T1(x,k) = xder(x,k);
            T2(x,k) = yder(x,k);
            T3(x,k) = j*xder(x,k) - i*yder(x,k);
            T4(x,k) = i*xder(x,k) + j*yder(x,k);
            T5(x,k) = i*xder(x,k) - j*yder(x,k);
            T6(x,k) = j*xder(x,k) + i*yder(x,k); 
            %T7(x,k) = xder(x,k)^2+yder(x,k)^2;
 
            
         end
    end
end
i=1;
j=1;

for g = 1:10
    
    test = input(g,:);
    
    for i=1:16
        
        for j=1:16
            
            k =(i-1)*16+j;
            k1=(i-2)*16+j;
            k2=(i)*16+j;
            k3=(i-1)*16+j-1;
            k4=(i-1)*16+j+1;

            if(i==1)
                k1 = (i-1)*16+j;
            end
            if(i==16)
                k2 = (i-1)*16+j;
            end
            if(j==1)
                k3 = (i-1)*16+j;
            end
            if(j==16)
                k4 = (i-1)*16+j;
            end
            
            xdertest(1,k) = (test(1,k2)-test(1,k1))/2 ;
            
            ydertest(1,k) = (test(1,k4)-test(1,k3))/2 ;
            
            Ttest(k,1) = xdertest(1,k);
            Ttest(k,2) = ydertest(1,k);
            Ttest(k,3) = j*xdertest(1,k) - i*ydertest(1,k);
            Ttest(k,4) = i*xdertest(1,k) + j*ydertest(1,k);
            Ttest(k,5) = i*xdertest(1,k) - j*ydertest(1,k);
            Ttest(k,6) = j*xdertest(1,k) + i*ydertest(1,k); 
            %Ttest(k,7) = xdertest(1,k)^2+ydertest(1,k)^2;
            
        end
    end
    
    for p=1:5000
        
        A(:,1:6) = (Ttest(:,:));
        r(1,:) =(T1(p,:)).*-1;
        r(2,:) =(T2(p,:)).*-1;
        r(3,:) =(T3(p,:)).*-1;
        r(4,:) =(T4(p,:)).*-1;
        r(5,:) =(T5(p,:)).*-1;
        r(6,:) =(T6(p,:)).*-1;
        %r(7,:) =(T7(p,:)).*-1;
        A(:,7:12) = r(:,:)';
        B = (datasmoothed(p)-test)';
        [U1,S,V]=svd(A,0);
        ans=V*(S\(U1'*B));
        dist(p)= norm(A*ans+B);
    end
    
    [values, index] = sort(dist,'ascend');
    
    label(g) = labels(index(1));
    if(label(g)==labels(g))
        accu=accu+1;
    end
    
    end
        
accu = (accu/10)*100;
        



