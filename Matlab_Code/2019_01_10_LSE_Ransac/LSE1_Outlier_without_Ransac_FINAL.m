close all; clc; clear all;

% ������ �Ķ���� ����
% y = ax + b;
a = 2;
b = 10;

% ������ �����ϴ� ���� ����
xi = -10:1:10;
yi = a*xi + b;

% ������ �����ϴ� ���鿡 ������ �߰�
stdv = 1;
xi = xi + stdv*randn(1,length(xi));
yi = yi + stdv*randn(1,length(yi));

%Outlier �����ϱ�
xi(1) = 40;
yi(1) = 20;


% ������ �� �׸���
figure; plot(xi,yi,'bx'); axis equal;

% ������ �Ķ���� ����
% Ax = b;   A = [xi 1];   b = [yi]
A = [xi' ones(length(xi),1)];
b = yi';
x = inv(A'*A)*A'*b;
a_ = x(1);
b_ = x(2);

% ������ �Ķ���ͷ� ���� �׸���
yi_ = a_*xi + b_;
hold on; plot(xi,yi_,'r-');
