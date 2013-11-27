clear all;
clc;

K = imread('tray.pgm');
G1 = fspecial('gaussian',[25 25],0.5);
I = imfilter(K,G1,'same');

S=K-I;

figure;
imshow(S>130)
