close all; clc; clear all;
%% gt �ҷ�����
load('gt.mat');
%% 'bmp'��� ���� ��� �߰��ϱ� / ���ϸ� ���� �ҷ��� �� ����
addpath('bmp');
%% ���� �ϳ��ϳ� �����ϱ�
for i=1:100:1600 %1600�� ������ 100 ������ ������ (�������ϰ�)
    figure;
    imshow(num2str(i,'%04d.bmp')); %������ ���� �����ְ�
    for j=1:1:gt(i).num
        A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
        hold on; %�������� rectangle �Լ��� ����Ͽ� �簢�� �׸���
        rectangle('Position', A, 'EdgeColor', 'r');
    end
    pause; %�������� �����ֱ����� pause�� �����
end