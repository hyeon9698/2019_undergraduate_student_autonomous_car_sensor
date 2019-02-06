close all; clc; clear all;
%% Input image
I = imread('sample.bmp');
img = imread ('sample.bmp');
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
T = 50;
bmag = imbinarize(magnitude2,T);
%%
id = ((bmag == 1) & degree >= (-135 -3) & degree <= (-135 +3));
bmag_45 = zeros(size(bmag));
bmag_45(id) = 1;
%% Show
figure; imshow(bmag_45,[]);
%%
%figure;
xi = [];
yi = [];
for i = 1:1:1024
    for j = 1:1:1280
        if bmag_45(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %hold on; plot(j,i,'go'); axis equal;
        end
    end
end
%% m>0 blue line
T = 5;
cnt = 0;
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
        xi_ = xi
        yi_1 = m_max*xi + n_max;
        hold on; plot(xi_,yi_1,'b-'); axis equal;
    end
    cnt = 0;
end
xi_ = xi
yi_1 = m_max*xi + n_max;
hold on; plot(xi_,yi_1,'b-'); axis equal;
%%
% %% m<0  red line
% T = 10;
% cnt = 0;
% c_max = 0;
% m_max = 0;
% n_max = 0;
% for i=1:1:100
%     id = randperm(length(xi),2);
%     
%     %hold on; plot(xi(id),yi(id),'ro');axis equal;
%     sxi = xi(id);
%     syi = yi(id);
% 
%     %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
%     m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
%     n = -m*sxi(1)+syi(1)
%     syi_=m*sxi+n;
%     %hold on; plot(sxi,syi,'b-');
%     for i=1:1:length(xi)
%         if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
%             cnt = cnt + 1;
%         end
%     %d=abs(m*sxi(i)-syi(i)+n < T)
%     end
%     if(cnt > c_max)
%         if(m < -0.5 && m>-3)
%             m_max = m;
%             n_max = n;
%             c_max = cnt;
%         end
%     end
%     cnt = 0;
% end
% 
% yi_2 = m_max*xi + n_max;
% hold on; plot(xi,yi_2,'r-'); axis equal;
%% final
figure; imshow(I); 
% for i=500:5:1024
%     for j=1:5:1280
%         if Ithresh(i, j) ==  1
%             hold on;
%             xi = [xi; j];
%             yi = [yi; i];
%             plot(j,i,'go');
%         end
%     end
% end
hold on; plot(xi_,yi_1,'b-'); axis equal;
%hold on; plot(xi_,yi_2,'r-'); axis equal;