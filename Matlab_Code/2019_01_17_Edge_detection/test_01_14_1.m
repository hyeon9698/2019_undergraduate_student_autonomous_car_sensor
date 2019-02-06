close all; clc; clear all;
%% Read in image
I = imread('sample.bmp');
imshow(I);
%% Convert to Ggrayscale image
Igray = rgb2gray(I);
imshow(Igray);
%%
xi = [];
yi = [];
for i=1:1:3
    for j=1:5:1280
        if Iopenned(i, j) ==  1
            hold on;
            xi = [xi; j];
            yi = [yi; i];
        end
    end
end