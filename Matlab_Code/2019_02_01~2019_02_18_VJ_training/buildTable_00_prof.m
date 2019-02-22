close all; clc; clear all;

folder = 'D:\��Թ���\[9] �������б�\[1] ��������\[1] �кο�����\vehicle sample\vehicle_detection';
pos_folder = [folder '\' 'pos_sel'];
neg_folder = [folder '\' 'neg_sel'];

file = dir([pos_folder '\*.jpg']);
for i=1:length(file)
    filename{i,1} = [folder '\pos_sel\' file(i).name];
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