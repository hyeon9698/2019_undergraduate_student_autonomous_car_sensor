close all; clc; clear all;

folder = 'C:\Users\14U530\Desktop\������\2018_���б�_1�г�_������_�б�_�ڷ�\2019_����_�кο�����_�����_������\��Ʈ��\2019_01_31_����\train';
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