close all; clc; clear all;
load('train\pos\');
positiveInstances = stopSignsAndCars(:,1:2);
imDir = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'stopSignImages');
addpath(imDir);
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'nonStopSigns');