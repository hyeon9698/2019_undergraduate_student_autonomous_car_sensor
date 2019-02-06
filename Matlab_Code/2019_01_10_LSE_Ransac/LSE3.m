close all; clc; clear all;

% 삼차방정식의 파라미터 선정
% y = ax^3 + bx^2 + cx + d;
a= 1;
b= -4;
c = -7;
d = 10;

% 삼차방정식을 구성하는 점들 생성
xi=-10:1:10;
yi=a*(xi.^3)+b*xi.^2+c*xi+d;

% 생성된 점 그리기
figure; plot(xi,yi,'bx'); axis equal;

% 이차방정식의 파라미터 추정
% Ax=b; A=[xi^2 xi 1]; b=[yi]
A=[xi.^3' xi.^2' xi' ones(length(xi),1)];
b=yi';
x=inv(A'*A)*A'*b;
a_=x(1);
b_=x(2);
c_=x(3);
d_=x(4);
% 추정된 파라미터로 방정식 그리기
yi_=a_*xi.^3+b_*xi.^2+c_*xi+d_;
hold on; plot(xi,yi_,'r-');