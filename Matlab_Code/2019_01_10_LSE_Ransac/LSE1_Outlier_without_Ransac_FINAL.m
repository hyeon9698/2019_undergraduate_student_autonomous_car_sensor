close all; clc; clear all;

% 직선의 파라미터 선정
% y = ax + b;
a = 2;
b = 10;

% 직선을 구성하는 점들 생성
xi = -10:1:10;
yi = a*xi + b;

% 직선을 구성하는 점들에 노이즈 추가
stdv = 1;
xi = xi + stdv*randn(1,length(xi));
yi = yi + stdv*randn(1,length(yi));

%Outlier 포함하기
xi(1) = 40;
yi(1) = 20;


% 생성된 점 그리기
figure; plot(xi,yi,'bx'); axis equal;

% 직선의 파라미터 추정
% Ax = b;   A = [xi 1];   b = [yi]
A = [xi' ones(length(xi),1)];
b = yi';
x = inv(A'*A)*A'*b;
a_ = x(1);
b_ = x(2);

% 추정된 파라미터로 직선 그리기
yi_ = a_*xi + b_;
hold on; plot(xi,yi_,'r-');
