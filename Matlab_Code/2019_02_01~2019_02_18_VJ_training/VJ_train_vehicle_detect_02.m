close all; clc; clear all;
load('gt.mat');
detector = vision.CascadeObjectDetector('vehicleDetector_Haar_with_neg_gen.xml');
detector.MaxSize = [300 300];
detector.MinSize = [32 40];
%detector.MergeThreshold = 4;
for i=506:1:510
    img=imread(['bmp\' num2str(i,'%04d') '.bmp']);
    
    bbox=step(detector,img);
    
    %[bbox,scores] = detect(detector,'threshold',1);
   detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'CAR');
   figure; imshow(detectedImg);

end