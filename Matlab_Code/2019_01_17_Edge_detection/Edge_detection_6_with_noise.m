close all; clc; clear all;
%% Read in image https://www.youtube.com/watch?v=1-jURfDzP1s
I = imread('sample.bmp');
imshow(I);
%% Convert to Ggrayscale image
Igray = rgb2gray(I);
imshow(Igray);
%% Convert to Binary image
level = 0.5; % <-��Ŭ���ؼ� �� ���� ���� ���Ѻ���
Ithresh = im2bw(Igray,level);
%imshowpair(Igray,Ithresh,'montage');
imshow(Ithresh);
%% clear noises
%se = strel('disk', 5);
%Iopenned = imopen(Ithresh,se);
%imshow(Iopenned);

%% ����� �����
xi = [];
yi = [];

%% �� ���
cnt = 0;
figure;
for i=300:10:1024
    for j=1:10:1280
        if Ithresh(i, j) ==  1
            hold on;
            xi = [xi; j];
            yi = [yi; 1024 - i];
            plot(j,1024 - i,'bx');
        end
    end
end
%% m>0 �� ����
T = 10;
cnt = 0;
c_max = 0;
f=0;
d=0;
for i=1:1:100
    id = randperm(length(xi),2);
    
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);

    %y=mx+n �������� ���� �� ������ �׷��� �׸���
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1)
    syi_=m*sxi+n;
    %hold on; plot(sxi,syi,'b-');
    for i=1:1:length(xi)
        if(abs(m*xi(i)+n - yi(i)) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max & m>0.5)
        m_max = m;
        n_max = n;
        c_max = cnt;
    end
    cnt = 0;
end

yi_ = m_max*xi + n_max;
hold on; plot(xi,yi_,'r-'); axis equal;
%% m<0 �� ����
T = 10;
cnt = 0;
c_max = 0;
f=0;
d=0;
for i=1:1:100
    id = randperm(length(xi),2);
    
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);

    %y=mx+n �������� ���� �� ������ �׷��� �׸���
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1)
    syi_=m*sxi+n;
    %hold on; plot(sxi,syi,'b-');
    for i=1:1:length(xi)
        if(abs(m*xi(i)+n - yi(i)) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max & m<-0.5)
        m_max = m;
        n_max = n;
        c_max = cnt;
    end
    cnt = 0;
end

yi_ = m_max*xi + n_max;
hold on; plot(xi,yi_,'b-'); axis equal;