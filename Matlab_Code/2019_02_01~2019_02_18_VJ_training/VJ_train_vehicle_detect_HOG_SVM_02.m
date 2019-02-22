close all; clc; clear;
%% 
load('gt.mat');
detector_HOG = vision.CascadeObjectDetector('vehicleDetector_HOG_with_neg_gen.xml');
%detector_Haar = vision.CascadeObjectDetector('vehicleDetector_Haar_with_neg_gen.xml');
%detector_LBP = vision.CascadeObjectDetector('vehicleDetector_LBP_with_neg_gen.xml');
%detector = vision.CascadeObjectDetector('vehicleDetector_Haar_with_neg_gen.xml');
%% HOG
TP = 0;
FP = 0;
FN = 0;
NOTFN = 0;
NOTFP = 0;
%detector.MaxSize = [300 300];
%detector.MinSize = [32 40];
%% HOG
for Threshold=4:1:4
    detector_HOG.MergeThreshold = Threshold;
for i=501:1:1200
    im = imread(['bmp\' num2str(i,'%04d') '.bmp']);
    bbox=step(detector_HOG,im);
    
    detectedImg = insertObjectAnnotation(im,'rectangle',bbox,'CAR');
    %figure; imshow(detectedImg);
    %% TP
    for j=1:1:gt(i).num
        NOTFN = 0;
        A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
        %hold on; %사진위에 rectangle 함수를 사용하여 사각형 그리기
        %rectangle('Position', A, 'EdgeColor', 'r');
        G_area = rectint(A,A);
        for k=1:1:size(bbox,1)
            B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
            P_area = rectint(B,B);
            G_P_area = rectint(A,B);
            AAA = G_P_area/(G_area+P_area-G_P_area);
            if(AAA>0.5)
                TP = TP + 1;
                x1 = B(1);
                x2 = B(1) + B(3) - 1;
                y1 = B(2);
                y2 = B(2) + B(4) - 1;
                cim = im(y1:y2,x1:x2);
                cim = imresize(cim,[40,40]);
                imwrite(cim,['train2\TP\' 'CAR' num2str(TP,'%04d') '.jpg']);
                NOTFN = NOTFN + 1;
            end
        end
        
        %% FN
        if (NOTFN == 0)
            FN = FN + 1;
        end
    end

%% FP

    for k=1:1:size(bbox,1)
        NOTFP = 0;
        B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
        P_area = rectint(B,B);
            for j=1:1:gt(i).num
                A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
                G_area = rectint(A,A);
                G_P_area = rectint(A,B);
                AAA = G_P_area/(G_area+P_area-G_P_area);
                if(AAA>0.5)
                    NOTFP = NOTFP + 1;
                end
            end
        if(NOTFP == 0)
            FP = FP + 1;
            x1 = B(1);
            x2 = B(1) + B(3) - 1;
            y1 = B(2);
            y2 = B(2) + B(4) - 1;
            cim = im(y1:y2,x1:x2);
            cim = imresize(cim,[40,40]);
            imwrite(cim,['train2\FP\' 'NOTCAR' num2str(FP,'%04d') '.jpg']);
        end
    end
end
%%
% precision = TP/(TP + FP);
% recall = TP/(TP + FN);
% hold on;
% plot(recall,precision,'bx');
% xlabel('recall');
% ylabel('precision');
% title('Threshold값에 따른 precision과 recall')
% axis([0 1 0 1]);
% grid on;
% grid on;

end
%%

%%
% %% Haar
% TP = 0;
% FP = 0;
% FN = 0;
% NOTFN = 0;
% NOTFP = 0;
% %detector.MaxSize = [300 300];
% %detector.MinSize = [32 40];
% %% 
% for Threshold=1:1:1
%     detector_Haar.MergeThreshold = Threshold;
% for i=501:1:600
%     im = imread(['bmp\' num2str(i,'%04d') '.bmp']);
%     bbox=step(detector_Haar,im);
%     
%     detectedImg = insertObjectAnnotation(im,'rectangle',bbox,'CAR');
%     %figure; imshow(detectedImg);
%     %% TP
%     for j=1:1:gt(i).num
%         NOTFN = 0;
%         A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
%         %hold on; %사진위에 rectangle 함수를 사용하여 사각형 그리기
%         %rectangle('Position', A, 'EdgeColor', 'r');
%         G_area = rectint(A,A);
%         for k=1:1:size(bbox,1)
%             B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
%             P_area = rectint(B,B);
%             G_P_area = rectint(A,B);
%             AAA = G_P_area/(G_area+P_area-G_P_area);
%             if(AAA>0.5)
%                 TP = TP + 1;
%                 NOTFN = NOTFN + 1;
%             end
%         end
%         
%         %% FN
%         if (NOTFN == 0)
%             FN = FN + 1;
%         end
%     end
% 
% %% FP
% 
%     for k=1:1:size(bbox)
%         NOTFP = 0;
%         B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
%         P_area = rectint(B,B);
%             for j=1:1:gt(i).num
%                 A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
%                 G_area = rectint(A,A);
%                 G_P_area = rectint(A,B);
%                 AAA = G_P_area/(G_area+P_area-G_P_area);
%                 if(AAA>0.5)
%                     NOTFP = NOTFP + 1;
%                 end
%             end
%         if(NOTFP == 0)
%             FP = FP + 1;
%         end
%     end
% end
% %%
% precision = TP/(TP + FP);
% recall = TP/(TP + FN);
% hold on;
% plot(recall,precision,'rx');
% xlabel('recall');
% ylabel('precision');
% title('Threshold값에 따른 precision과 recall')
% axis([0 1 0 1]);
% grid on;
% grid on;
% 
% end
% %% LBP
% TP = 0;
% FP = 0;
% FN = 0;
% NOTFN = 0;
% NOTFP = 0;
% %detector.MaxSize = [300 300];
% %detector.MinSize = [32 40];
% %% 
% for Threshold=1:1:1
%     detector_LBP.MergeThreshold = Threshold;
% for i=501:1:600
%     im = imread(['bmp\' num2str(i,'%04d') '.bmp']);
%     bbox=step(detector_LBP,im);
%     
%     detectedImg = insertObjectAnnotation(im,'rectangle',bbox,'CAR');
%     %figure; imshow(detectedImg);
%     %% TP
%     for j=1:1:gt(i).num
%         NOTFN = 0;
%         A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
%         %hold on; %사진위에 rectangle 함수를 사용하여 사각형 그리기
%         %rectangle('Position', A, 'EdgeColor', 'r');
%         G_area = rectint(A,A);
%         for k=1:1:size(bbox,1)
%             B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
%             P_area = rectint(B,B);
%             G_P_area = rectint(A,B);
%             AAA = G_P_area/(G_area+P_area-G_P_area);
%             if(AAA>0.5)
%                 TP = TP + 1;
%                 NOTFN = NOTFN + 1;
%             end
%         end
%         
%         %% FN
%         if (NOTFN == 0)
%             FN = FN + 1;
%         end
%     end
% 
% %% FP
% 
%     for k=1:1:size(bbox)
%         NOTFP = 0;
%         B = [bbox(k,1),bbox(k,2),bbox(k,3),bbox(k,4)];
%         P_area = rectint(B,B);
%             for j=1:1:gt(i).num
%                 A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
%                 G_area = rectint(A,A);
%                 G_P_area = rectint(A,B);
%                 AAA = G_P_area/(G_area+P_area-G_P_area);
%                 if(AAA>0.5)
%                     NOTFP = NOTFP + 1;
%                 end
%             end
%         if(NOTFP == 0)
%             FP = FP + 1;
%         end
%     end
% end
% %%
% precision = TP/(TP + FP);
% recall = TP/(TP + FN);
% hold on;
% plot(recall,precision,'kx');
% xlabel('recall');
% ylabel('precision');
% title('Threshold값에 따른 precision과 recall')
% axis([0 1 0 1]);
% grid on;
% grid on;
% 
% end