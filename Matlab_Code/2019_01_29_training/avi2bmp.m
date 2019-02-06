close all; clc; clear all;

n = 0;
v = VideoReader('jan28.avi');
while hasFrame(v)
    n = n + 1
    im = rgb2gray(readFrame(v));
    imwrite(im,['bmp\' num2str(n,'%04d') '.bmp']);    
end
