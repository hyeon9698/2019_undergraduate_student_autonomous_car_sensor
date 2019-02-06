close all; clc; clear all;

% ������������ �Ķ���� ����
% y = ax^2 + bx + c;
a= 1;
b= -5;
c = -25;

% ������������ �����ϴ� ���� ����
xi=-10:1:10;
yi=a*(xi.^2)+b*xi+c;

% ������ �� �׸���
figure; plot(xi,yi,'bx'); axis equal;

% ������������ �Ķ���� ����
% Ax=b; A=[xi^2 xi 1]; b=[yi]
A=[xi.^2' xi' ones(length(xi),1)];
b=yi';
x=inv(A'*A)*A'*b;
a_=x(1);
b_=x(2);
c_=x(3);

% ������ �Ķ���ͷ� ������ �׸���
yi_=a_*xi.^2+b_*xi+c_;
hold on; plot(xi,yi_,'r-');