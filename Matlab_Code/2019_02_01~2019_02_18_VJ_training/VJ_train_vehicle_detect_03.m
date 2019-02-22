close all; clc; clear all;
detector = vision.CascadeObjectDetector('vehicleDetector_HOG_with_neg_gen.xml');
%detector.MaxSize = [155 145];
detector.MergeThreshold = 10;
results(5) = struct('Boxes',[],'Scores',[]);
for i=501:1:505
    img=imread(['bmp\' num2str(i,'%04d') '.bmp']);
    
    [bboxes,scores] = detect(detector,img);
    results(i).Boxes = bboxes;
    results(i).Scores = scores;
    
    %bbox=step(detector,img);
    %[bbox,scores] = detect(detector,'threshold',1);
    %detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'CAR');
    %figure; imshow(detectedImg);
    %pause;
end
results = struct2table(results);
[ap,recall,precision] = evaluateDetectionPrecision(results);
figure;
plot(recall,precision);
grid on;
title(sprintf('Average Precision = %.1f',ap));