close all; clc; clear all;

% 직선의 파라미터 선정
% y = ax + b;
a = 2;
b = 10;

% 직선을 구성하는 점들 생성
xi = -10:1:10;
yi = a*xi + b;

id = randperm(length(xi),2)


% 생성된 점 그리기
figure; plot(xi,yi,'bx');
% 방법 1
for i=1:1:2
    hold on; plot(xi(id(i)),yi(id(i)),'ro');
end
% 방법 2
hold on; plot(xi(id),yi(id),'ro');
axis equal;

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
