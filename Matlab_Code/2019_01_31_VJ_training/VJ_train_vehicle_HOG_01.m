close all; clc; clear all;

% ÇÐ½À
load('vehicle_detection.mat');
trainCascadeObjectDetector('vehicleDetector_LBP_with_neg_gen.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.5,'TruePositiveRate',0.995,'NumCascadeStages',20,'FeatureType','LBP');
%trainCascadeObjectDetector('vehicleDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);