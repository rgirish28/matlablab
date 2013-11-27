function value = tangentcomp(inputs)

%T = zeros(9,size(input,2));

for k=1:size(inputs,2)
    j=round((k/16)+1);
    i=rem(k,16)+1;
    value(:,k)=double(inputs(:,k)).*exp(-1*(i^2+j^2)/2);
end

end

