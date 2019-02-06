close all; clc; clear all;
%% Input image
I = imread('sample.bmp');
img = imread ('sample.bmp');
%% Show input image
img = rgb2gray(img);
img = double (img);
%% Filter for horizontal and vertical direction
KGx = [1, 0, -1; 1, 0, -1; 1, 0, -1];
KGy = [1, 1, 1; 0, 0, 0; -1, -1, -1];
%% Convolution by image by horizontal and vertical filter


[rows,cols] = size(img);

new_img = zeros(rows+2,cols+2);
new_img(2:end-1,2:end-1) = img;

for i=2:1:rows+1
  for j=2:1:cols+1
    value=0;
    for g=-1:1:1
      for l=-1:1:1
        value=value+new_img(i+g,j+l)*KGx(g+2,l+2);
      end
    end
   Filtered_X(i,j)=value;
  end
end

figure; imshow(Filtered_X,[]);

% for l=1:
% for i=1:1:3
%     for j=1:1:3
%         Filtered_X(l,k) = img(i,j)*KGx(l-i+1,k-j+1);
%     end
% end
% for i=1:1:3
%     for j=1:1:3
%         Filtered_Y(l,k) = img(i,j)*KGy(l-i+1,k-j+1);
%     end
% end        
%% Calculate directions/orientations
degree = atan2 (Filtered_Y, Filtered_X);
degree = degree*180/pi;
%% Calculate magnitude
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);