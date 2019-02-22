close all; clc; clear all;

folder = 'C:\Users\14U530\Desktop\조동현\2018_대학교_1학년_조동현_학교_자료\2019_동계_학부연구생_서재규_교수님\매트랩\2019_01_31_과제\train';
pos_folder = [folder '\' 'pos'];
neg_folder = [folder '\' 'neg'];

file = dir([pos_folder '\*.jpg']);

for i=1:length(file)
    filename{i,1} = [folder '\pos\' file(i).name];
    rect{i,1} = [1 1 40 32];
end
positiveInstances = table(filename,rect);

% mydata= struct('imageFilename', 'Just a random string', 'objectBoundingBoxes', 'Just a random string');
% for i=1:length(file)
%  mydata(i).imageFilename = strcat('pos_sel/', file(i).name);
%  mydata(i).objectBoundingBoxes = [1, 1, 40, 32];
% end
% positiveInstances = mydata;

negativeFolder = neg_folder;

save('vehicle_detection.mat','positiveInstances','negativeFolder');