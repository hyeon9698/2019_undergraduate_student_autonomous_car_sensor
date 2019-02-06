close all; clc; clear all;

% ������ �Ķ���� ����
% y = ax + b;
a = 2;
b = 10;

% ������ �����ϴ� ���� ����
xi = -10:1:10;
yi = a*xi + b;

id = randperm(length(xi),2)


% ������ �� �׸���
figure; plot(xi,yi,'bx');
% ��� 1
for i=1:1:2
    hold on; plot(xi(id(i)),yi(id(i)),'ro');
end
% ��� 2
hold on; plot(xi(id),yi(id),'ro');
axis equal;

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
