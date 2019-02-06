close all; clc; clear all;

% ������������ �Ķ���� ����
% y = ax^3 + bx^2 + cx + d;
a= 1;
b= -4;
c = -7;
d = 10;

% ������������ �����ϴ� ���� ����
xi=-10:1:10;
yi=a*(xi.^3)+b*xi.^2+c*xi+d;

% ������ �� �׸���
figure; plot(xi,yi,'bx'); axis equal;

% ������������ �Ķ���� ����
% Ax=b; A=[xi^2 xi 1]; b=[yi]
A=[xi.^3' xi.^2' xi' ones(length(xi),1)];
b=yi';
x=inv(A'*A)*A'*b;
a_=x(1);
b_=x(2);
c_=x(3);
d_=x(4);
% ������ �Ķ���ͷ� ������ �׸���
yi_=a_*xi.^3+b_*xi.^2+c_*xi+d_;
hold on; plot(xi,yi_,'r-');