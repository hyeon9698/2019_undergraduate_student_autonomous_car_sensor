close all; clc; clear all;
%% Input image
img = imread ('KAKA.jpg');
%% Show input image
figure, imshow(img);
img = rgb2gray(img);
img = double (img);
%% Filter for horizontal and vertical direction
KGx = [1, 0, -1; 1, 0, -1; 1, 0, -1];
KGy = [1, 1, 1; 0, 0, 0; -1, -1, -1];
%% Convolution by image by horizontal and vertical filter
Filtered_X = conv2(img, KGx, 'same');
Filtered_Y = conv2(img, KGy, 'same');
%%
%figure; imshow(Filtered_X);
%figure; imshow(Filtered_Y);
%% Calculate directions/orientations
degree = atan2 (Filtered_Y, Filtered_X);
degree = degree*180/pi;
%% Calculate magnitude
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);
%%
bmag = (magnitude2>=50);
%% Show
%% µð±×¸® = bmag
figure; imshow(bmag,[]);
figure; imshow(magnitude2,[0 200]);