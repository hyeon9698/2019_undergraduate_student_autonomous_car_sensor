close all; clc; clear all;

% 이차방정식의 파라미터 선정
% y = ax^2 + bx + c;
a= 1;
b= -5;
c = -25;

% 이차방정식을 구성하는 점들 생성
xi=-10:1:10;
yi=a*(xi.^2)+b*xi+c;

% 생성된 점 그리기
figure; plot(xi,yi,'bx'); axis equal;

% 이차방정식의 파라미터 추정
% Ax=b; A=[xi^2 xi 1]; b=[yi]
A=[xi.^2' xi' ones(length(xi),1)];
b=yi';
x=inv(A'*A)*A'*b;
a_=x(1);
b_=x(2);
c_=x(3);

% 추정된 파라미터로 방정식 그리기
yi_=a_*xi.^2+b_*xi+c_;
hold on; plot(xi,yi_,'r-');