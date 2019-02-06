clc; clear all;

load('stopSignsAndCars.mat');
positiveInstances = stopSignsAndCars(:,1:2);
imDir = fullfile(matlabroot,'toolbox','vision','visiondata', 'stopSignImages');
addpath(imDir);
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');
negativeImages = imageDatastore(negativeFolder);


trainCascadeObjectDetector('stopSignDetector.xml',positiveInstances, negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);

detector = vision.CascadeObjectDetector('stopSignDetector.xml');
img = imread('stopSignTest.jpg');
bbox = step(detector,img);
detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'stop sign');
figure; imshow(detectedImg);