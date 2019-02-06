close all; clc; clear all;
%% gt �ҷ�����
load('gt.mat');
%% 'bmp'��� ���� ��� �߰��ϱ� / ���ϸ� ���� �ҷ��� �� ����
%addpath('bmp');
%% ���� ����
for i=1:1:500
    im = imread(['bmp\' num2str(i,'%04d') '.bmp']);
        for j=1:1:gt(i).num
            A = [gt(i).rect(j,1), gt(i).rect(j,2), gt(i).rect(j,3), gt(i).rect(j,4)];
            x1 = gt(i).rect(j,1);
            x2 = gt(i).rect(j,1) + gt(i).rect(j,3) - 1;
            y1 = gt(i).rect(j,2);
            y2 = gt(i).rect(j,2) + gt(i).rect(j,4) - 1;
            cim = im(y1:y2,x1:x2);
            cim = imresize(cim,[32,40]);
            imwrite(cim, ['train\pos\' 'CAR' num2str(i,'%04d') '_' num2str(j) '.jpg']);
        end
end
%% ���� �ƴ� ����
for i=1:1:500
    im = imread(['bmp\' num2str(i,'%04d') '.bmp']);
        for j=1:1:gt(i).num
            A = [gt(i).rect(j,1), gt(i).rect(j,2), gt(i).rect(j,3), gt(i).rect(j,4)];
            x1 = gt(i).rect(j,1);
            x2 = gt(i).rect(j,1) + gt(i).rect(j,3) - 1;
            y1 = gt(i).rect(j,2);
            y2 = gt(i).rect(j,2) + gt(i).rect(j,4) - 1;
            im(y1:y2,x1:x2) = 128;
        end
        imwrite(im, ['train\neg\' 'NOTCAR' num2str(i,'%04d') '_'  '.jpg']);
end