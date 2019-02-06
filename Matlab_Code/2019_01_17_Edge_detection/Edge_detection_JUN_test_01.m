close all; clc; clear all;
%% Input image
I = imread('KAKA.jpg');
img = imread('KAKA.jpg');
[Xsize, Ysize, rgb] = size(I);
%% Show input image
img = rgb2gray(img);
img = double (img);
%% Filter for horizontal and vertical direction
KGx = [1, 0, -1; 1, 0, -1; 1, 0, -1];
KGy = [1, 1, 1; 0, 0, 0; -1, -1, -1];
%% Convolution by image by horizontal and vertical filter
Filtered_X = conv2(img, KGx, 'same');
Filtered_Y = conv2(img, KGy, 'same');
%%
%figure; imshow(Filtered_X,[]);
%figure; imshow(Filtered_Y,[]);
%% Calculate directions/orientations
degree = atan2 (Filtered_Y, Filtered_X);
degree = degree*180/pi;
%% Calculate magnitude
magnitude = (Filtered_X.^2) + (Filtered_Y.^2);
magnitude2 = sqrt(magnitude);
%% 사진 이진화 시키기
T = 40;
bmag = imbinarize(magnitude2,T);
figure; imshow(bmag);
%% 왼쪽 안쪽
id = ((bmag == 1) & degree >= (-135 -3) & degree <= (-135 +3));
bmag_45 = zeros(size(bmag));
bmag_45(id) = 1;
%% 왼쪽 바깥쪽
id = ((bmag == 1) & degree >= (45 -3) & degree <= (45 +3));
bmag_45o = zeros(size(bmag));
bmag_45o(id) = 1;
%% 오른쪽 안쪽
id = ((bmag == 1) & degree >= (-45 -3) & degree <= (-45 +3));
bmag_135 = zeros(size(bmag));
bmag_135(id) = 1;
%% 오른쪽 바깥쪽
id = ((bmag == 1) & degree >= (135 -3) & degree <= (135 +3));
bmag_135o = zeros(size(bmag));
bmag_135o(id) = 1;
%% Show
figure; imshow(bmag_45,[]);
figure; imshow(bmag_45o,[]);
figure; imshow(bmag_135,[]);
figure; imshow(bmag_135o,[]);
%% 45
%figure;
xi = [];
yi = [];
for i = 1:1:Xsize
    for j = 1:1:Ysize
        if bmag_45(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %hold on; plot(j,i,'go'); axis equal;
        end
    end
end
T = 5; %거리 임계치
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:200
    id = randperm(length(xi),2);
    cnt = 0;
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);
    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/((1+m.^2).^0.5) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        m_max = m;
        n_max = n;
        c_max = cnt;
        xi_ = xi;
        yi_1 = m_max*xi + n_max;
        %hold on; plot(xi_,yi_1,'b-'); axis equal;
    end
end
xi_45 = xi;
yi_45 = m_max*xi + n_max;
%hold on; plot(xi_45,yi_45,'b-'); axis equal;
%% 45o
%figure;
xi = [];
yi = [];
for i = 1:1:Xsize
    for j = 1:1:Ysize
        if bmag_45o(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %hold on; plot(j,i,'go'); axis equal;
        end
    end
end
T = 5;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:200
    id = randperm(length(xi),2);
    cnt = 0;
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);
    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/((1+m.^2).^0.5) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        m_max = m;
        n_max = n;
        c_max = cnt;
        xi_ = xi;
        yi_1 = m_max*xi + n_max;
        %hold on; plot(xi_,yi_1,'b-'); axis equal;
    end
end
xi_45o = xi;
yi_45o = m_max*xi + n_max;
%hold on; plot(xi_45o,yi_45o,'b-'); axis equal;
%% 135
%figure;
xi = [];
yi = [];
for i = 1:1:Xsize
    for j = 1:1:Ysize
        if bmag_135(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %hold on; plot(j,i,'go'); axis equal;
        end
    end
end
T = 5;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:200
    id = randperm(length(xi),2);
    cnt = 0;
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);
    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/((1+m.^2).^0.5) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        m_max = m;
        n_max = n;
        c_max = cnt;
        xi_ = xi;
        yi_1 = m_max*xi + n_max;
        %hold on; plot(xi_,yi_1,'b-'); axis equal;
    end
end
xi_135 = xi;
yi_135 = m_max*xi + n_max;
%hold on; plot(xi_135,yi_135,'b-'); axis equal;
%% 135o
%figure;
xi = [];
yi = [];
for i = 1:1:Xsize
    for j = 1:1:Ysize
        if bmag_135o(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %hold on; plot(j,i,'go'); axis equal;
        end
    end
end
T = 5;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:200
    id = randperm(length(xi),2);
    cnt = 0;
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);
    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/((1+m.^2).^0.5) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        m_max = m;
        n_max = n;
        c_max = cnt;
        xi_ = xi;
        yi_1 = m_max*xi + n_max;
        %hold on; plot(xi_,yi_1,'b-'); axis equal;
    end
end
xi_135o = xi;
yi_135o = m_max*xi + n_max;
%hold on; plot(xi_135o,yi_135o,'b-'); axis equal;
%% final
figure; imshow(I); 
hold on; plot(xi_45,yi_45,'b-'); axis equal;
hold on; plot(xi_45o,yi_45o,'r-'); axis equal;
hold on; plot(xi_135,yi_135,'b-'); axis equal;
hold on; plot(xi_135o,yi_135o,'r-'); axis equal;