im = imread('sample.bmp');
im = rgb2gray(im);
im = double(im);
BW1 = edge(im,'sobel');
BW2 = edge(im,'canny');
figure;
imshowpair(BW1,BW2,'montage');