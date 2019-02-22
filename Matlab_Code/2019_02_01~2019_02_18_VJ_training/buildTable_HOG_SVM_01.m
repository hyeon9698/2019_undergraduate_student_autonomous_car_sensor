close all; clc; clear;
%% train
%positive
folder = 'C:\Users\14U530\Desktop\������\2019_���б�_2�г�_������_�б�_�ڷ�\2019_����_�кο�����_�����_������\matlab_code\2019_01_31_VJ_training';
pos_file = dir([folder '\train3' '\TP' '\*.jpg']);
for i=1:length(pos_file)
    im = imread(['train3\TP\' 'CAR' num2str(i,'%04d') '.jpg']);
    f = extractHOGFeatures(im);
    pos_feat(i,:) = f;
    pos_class(i,:) = 1; %negative �̹��� �Ҷ��� 0 �ϱ�
end
%negative
neg_file = dir([folder '\train3' '\FP' '\*.jpg']);
for i=1:length(neg_file)
    im = imread(['train3\FP\' 'NOTCAR' num2str(i,'%04d') '.jpg']);
    f = extractHOGFeatures(im);
    neg_feat(i,:) = f;
    neg_class(i,:) = 0; %negative �̹��� �Ҷ��� 0 �ϱ�
end
%%
feat = [pos_feat; neg_feat];
class = [pos_class; neg_class];
%%
SVMModel = fitcsvm(feat,class);
%% Save
save('SVMModel.mat', 'SVMModel');
% %% �� ������ �� Ȯ��
% %[pos_class_test, pos_score_test] = predict(SVMModel,feat(20,:)); %positive 20���� �࿡ �ִ� ���� �� 
% %[neg_class_test, neg_score_test] = predict(SVMModel,feat(370,:));
% %% ���ο� �Ϳ� Ȯ��
% %im = imread(['test\TP\' 'CAR' num2str(371,'%04d') '.jpg']);
% %f = extractHOGFeatures(im);
% %[car_class_new, car_score_new] = predict(SVMModel,f(:,:)); %-> feat�� ���� �� ����������
% 
% 
% %% test TP ���� ���� ������
% test_TP_file = dir([folder '\test' '\TP' '\*.jpg']);
% figure;
% xlabel('Threshold');
% ylabel('TPR & TNR');
% title('Threshold���� ���� TPR �� TNR')
% axis([-5 5 0 1]);
% grid on;
% %% ���ھ� �ƽ� ã��
% Maxtpscore = 0;
% Maxfpscore = 0;
% for i=801:1:801+length(test_TP_file)-1
%     im = imread(['test\TP\' 'CAR' num2str(i,'%04d') '.jpg']);
%     f = extractHOGFeatures(im);
%     [car_class_new, car_score_new] = predict(SVMModel,f(:,:));
%     if(car_score_new(2)>Maxtpscore)
%         Maxtpscore = car_score_new(2);
%     end
% end
% test_FP_file = dir([folder '\test' '\FP' '\*.jpg']);
% for i=801:1:801+length(test_FP_file)-1
%     im = imread([ 'test\FP\' 'NOTCAR' num2str(i,'%04d') '.jpg']);
%     f = extractHOGFeatures(im);
%     [car_class_new, car_score_new] = predict(SVMModel,f(:,:));
%     if(car_score_new(1)>Maxfpscore)
%         Maxfpscore = car_score_new(1);
%     end
% end
% %% Threshold
% 
% for score_threshold = -max(Maxtpscore, Maxfpscore):0.1:max(Maxtpscore, Maxfpscore)
%     NOTcar_TP = 0;
%     car_TP = 0;
% for i=801:1:801+length(test_TP_file)-1
%     im = imread(['test\TP\' 'CAR' num2str(i,'%04d') '.jpg']);
%     f = extractHOGFeatures(im);
%     [car_class_new, car_score_new] = predict(SVMModel,f(:,:));
%     if(car_score_new(2) >= score_threshold)
%         car_TP = car_TP + 1;
%     end
%     if(car_score_new(2) < score_threshold)
%         NOTcar_TP = NOTcar_TP + 1;
%     end
% end
% %% test FP ���� ���� ������
% test_FP_file = dir([folder '\test' '\FP' '\*.jpg']);
% NOTcar_FP = 0;
% car_FP = 0;
% for i=801:1:801+length(test_FP_file)-1
%     im = imread([ 'test\FP\' 'NOTCAR' num2str(i,'%04d') '.jpg']);
%     f = extractHOGFeatures(im);
%     [car_class_new, car_score_new] = predict(SVMModel,f(:,:));
%     if(car_score_new(2) >= score_threshold)
%         car_FP = car_FP + 1;
%     end
%     if(car_score_new(2) < score_threshold)
%         NOTcar_FP = NOTcar_FP + 1;
%     end
% end
% %% TPR & TNR
% %TPR
% %TP/(TP+FN)
% TPR = car_TP/length(test_TP_file);
% TNR = NOTcar_FP/length(test_FP_file);
% %%
% hold on;
% plot(score_threshold,TPR,'rx');
% hold on;
% plot(score_threshold,TNR,'bx');
%end