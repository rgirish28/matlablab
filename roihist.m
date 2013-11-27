function [h] = roihist()

x = getimage(gcf);
%set(gcf,'Color',[1.0,0.0,0.0]);
bw = roipoly;
x2 = x(bw);
i = min(x2) : (max(x2)- min(x2))/64.0 : max(x2);
h = hist(x2,i);
figure;
%bar(i,h);
stem(i,h);
