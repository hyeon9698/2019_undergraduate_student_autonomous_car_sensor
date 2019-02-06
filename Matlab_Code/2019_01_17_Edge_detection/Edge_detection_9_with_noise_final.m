close all; clc; clear all;
%% Read in image
I = imread('sample.bmp');
imshow(I);

%% Convert to Ggrayscale image
Igray = rgb2gray(I);
imshow(Igray);

%% Convert to Binary image
level = 0.5; % <-우클릭해서 값 증가 감소 시켜보기
Ithresh = im2bw(Igray,level);
%imshowpair(Igray,Ithresh,'montage');
imshow(Ithresh);

%% clear noises
%se = strel('disk', 5);
%Iopenned = imopen(Ithresh,se);
%imshow(Iopenned);

%% point the dots
xi = [];
yi = [];
for i=500:5:1024
    for j=1:5:1280
        if Ithresh(i, j) ==  1
            hold on;
            xi = [xi; j];
            yi = [yi; i];
            plot(j,i,'go');
        end
    end
end

%% m>0 blue line
T = 5;
cnt = 0;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:100
    id = randperm(length(xi),2);
    
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);

    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1)
    syi_=m*sxi+n;
    %hold on; plot(sxi,syi,'b-');
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        %if(m > 0.5 && m < 3)
            m_max = m;
            n_max = n;
            c_max = cnt;
        %end
    end
    cnt = 0;
end
xi_ = xi
yi_1 = m_max*xi + n_max;
hold on; plot(xi_,yi_1,'b-'); axis equal;
%% m<0  red line
T = 10;
cnt = 0;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:100
    id = randperm(length(xi),2);
    
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);

    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1)
    syi_=m*sxi+n;
    %hold on; plot(sxi,syi,'b-');
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
            cnt = cnt + 1;
        end
    %d=abs(m*sxi(i)-syi(i)+n < T)
    end
    if(cnt > c_max)
        if(m < -0.5 && m>-3)
            m_max = m;
            n_max = n;
            c_max = cnt;
        end
    end
    cnt = 0;
end

yi_2 = m_max*xi + n_max;
hold on; plot(xi,yi_2,'r-'); axis equal;
%% final
figure;
imshow(I); 
for i=500:5:1024
    for j=1:5:1280
        if Ithresh(i, j) ==  1
            hold on;
            xi = [xi; j];
            yi = [yi; i];
            plot(j,i,'go');
        end
    end
end
hold on; plot(xi_,yi_1,'b-'); axis equal;
hold on; plot(xi_,yi_2,'r-'); axis equal;