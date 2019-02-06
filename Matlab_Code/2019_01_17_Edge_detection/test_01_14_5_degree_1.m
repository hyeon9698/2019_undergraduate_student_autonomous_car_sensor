close all; clc; clear all;
%% Input image
img = imread ('sample.bmp');
%% Show input image
figure, imshow(img);
img = rgb2gray(img);
img = double (img);
%% Filter for horizontal and vertical direction
KGx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
KGy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
%% Gaussian Filter Coefficient
B = [2, 4, 5, 4, 2; 4, 9, 12, 9, 4;5, 12, 15, 12, 5;4, 9, 12, 9, 4;2, 4, 5, 4, 2 ];
B = 1/159.* B;
%Convolution of image by Gaussian Coefficient
A=conv2(img, B, 'same');
%% Convolution by image by horizontal and vertical filter
Filtered_X = conv2(A, KGx, 'same');
Filtered_Y = conv2(A, KGy, 'same');
%% Calculate directions/orientations
degree = atan2 (Filtered_Y, Filtered_X);
degree = degree*180/pi;
%% Calculate magnitude
%magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
%magnitude2 = sqrt(magnitude);
%% Show
figure; imshow(degree);