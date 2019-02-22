load('stopSignsAndCars.mat')
stopSigns = stopSignsAndCars(:,1:2);
stopSigns.imageFilename = fullfile(toolboxdir('vision'),'visiondata', ...
    stopSigns.imageFilename);
detector = trainACFObjectDetector(stopSigns,'NegativeSamplesFactor',2);





numImages = height(stopSigns);
results(numImages) = struct('Boxes',[],'Scores',[]);
for i = 1:numImages
    I = imread(stopSigns.imageFilename{i});
    [bboxes,scores] = detect(detector,I);
    results(i).Boxes = bboxes;
    results(i).Scores = scores;
end

results = struct2table(results);
[ap,recall,precision] = evaluateDetectionPrecision(results,stopSigns(:,2));
figure
plot(recall,precision)
grid on
title(sprintf('Average Precision = %.1f',ap))