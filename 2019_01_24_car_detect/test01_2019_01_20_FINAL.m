close all; clc; clear all;
%% gt 불러오기
load('gt.mat');
%% 'bmp'라는 파일 경로 추가하기 / 안하면 사진 불러올 수 없음
addpath('bmp');
%% 사진 하나하나 적용하기
for i=1:100:1600 %1600장 사진을 100 단위로 돌리기 (보기편하게)
    figure;
    imshow(num2str(i,'%04d.bmp')); %사진을 먼저 보여주고
    for j=1:1:gt(i).num
        A = [gt(i).rect(j,1) gt(i).rect(j,2) gt(i).rect(j,3) gt(i).rect(j,4)];
        hold on; %사진위에 rectangle 함수를 사용하여 사각형 그리기
        rectangle('Position', A, 'EdgeColor', 'r');
    end
    pause; %한장한장 보여주기위해 pause를 사용함
end