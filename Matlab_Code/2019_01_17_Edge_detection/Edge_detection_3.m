%% Read in image https://www.youtube.com/watch?v=1-jURfDzP1s
I = imread('sample.bmp');
imshow(I);
%% Convert to Ggrayscale image
Igray = rgb2gray(I);
imshow(Igray);
%% Convert to Binary image
level = 0.5; % <-우클릭해서 값 증가 감소 시켜보기
Ithresh = im2bw(Igray,level);
%imshowpair(Igray,Ithresh,'montage');
imshow(Ithresh);
%% clear noises
se = strel('disk', 5);
Iopenned = imopen(Ithresh,se);
imshow(Iopenned);
%%
% %%
% Iregion = regionprops(Iopenned,'centroid');
% [labeled, numObjects] = bwlabel(Iopenned,4);
% stats = regionprops(labeled,'Eccentricity', 'Area','Bound')
% areas = [stats.Area];
% eccentricities = [stats.Eccentricity];
% %%
% idxOfSkittles = find(eccentricities);
% statsDefects = stats(idxOfSkittles);
% figure, imshow(I);
% hold on;
% for idx = 1 : length(idxOfSkittles)
%     h = rectangle('Position',statsDefects(idx).BoundingBox)
%     set(h,'EdgeColor',[.75 0 0]);
%     hold on;
% end
% if idx > 10
%     title(['There are ', num2str(numObjects), ' objects in']);
% end
% hold off;
%%
imtool(Iopenned);