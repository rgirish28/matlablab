x = pgmread('brains.pgm');
my_disp(x);
K = x>195; 
imshow(K);
