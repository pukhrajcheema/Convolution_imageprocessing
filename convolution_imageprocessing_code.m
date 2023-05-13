# Convolution_imageprocessing
close all;
clc;
clear;
%read the image
im  = imread('cameraman.tif');
%creating figure
figure;
subplot(1,2,1)
imshow(im);
title('before convolution')
im = double(im);

%the array that needs to be convolved
SE = [0,1/6,0;2/6,0,2/6;0,1/6,0];
%creating a new array that can store the convolve values
new = (zeros(size(im,1)-size(SE,1)+1,size(im,2)-size(SE,2)+1));
%convolution 
for i=1:size(im,1)-2
    for j=1:size(im,2)-2
        a = im(i:i+2,j:j+2).*SE;
        new(i,j) = sum(sum(a));

    end
end
%casting to 8bit integer so that we can see the image
new = uint8(new);
%plotting the after convolution image
subplot(1,2,2);
imshow(new);
title('after convolution');
