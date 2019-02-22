close all; clc; clear all;

% ÇÐ½À
load('vehicle_detection.mat');
trainCascadeObjectDetector('vehicleDetector_HOG_with_neg_gen.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.1,'TruePositiveRate',0.995,'NumCascadeStages',20,'FeatureType','HOG');
%trainCascadeObjectDetector('vehicleDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);