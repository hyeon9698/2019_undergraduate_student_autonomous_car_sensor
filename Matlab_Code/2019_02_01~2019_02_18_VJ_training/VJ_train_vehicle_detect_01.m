close all; clc; clear all;
detector = vision.CascadeObjectDetector('vehicleDetector_HOG_with_neg_gen.xml');
for i=1:1:5
    img=imread(['bmp\' num2str(i,'%04d') '.bmp']);
    bbox=step(detector,img);
    %[bbox,scores] = detect(acfDetector, I,'threshold',1);
    detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'CAR');
    figure; imshow(detectedImg);
    pause;
end