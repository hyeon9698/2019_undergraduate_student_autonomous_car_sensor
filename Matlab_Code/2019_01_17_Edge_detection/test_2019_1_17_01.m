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
%%
T = 10;
bmag = imbinarize(magnitude2,T);










%% bmag_45
id_45 = ((bmag == 1) & degree >= (-135 -5) & degree <= (-135 +5));
bmag_45 = zeros(size(bmag));
bmag_45(id_45) = 1;
%% bmag_135
id_135 = ((bmag == 1) & degree >= (-55 -5) & degree <= (-55 +5));
bmag_135 = zeros(size(bmag));
bmag_135(id_135) = 1;
%% bmag_45a
id_45a = ((bmag == 1) & degree >= (50 -5) & degree <= (50 +5)); %bmag_45도에 + 180도
bmag_45a = zeros(size(bmag));
bmag_45a(id_45a) = 1;
%% bmag_135a
id_135a = ((bmag == 1) & degree >= (130 -5) & degree <= (130 +5)); %bmag_135도에 + 180도
bmag_135a = zeros(size(bmag));
bmag_135a(id_135a) = 1;





%% Show
% figure; imshow(bmag_45,[]);
% figure; imshow(bmag_135,[]);
% figure; imshow(bmag_45a,[]);
figure; imshow(bmag_135a,[]);






% 
% %% 45
% xi = [];
% yi = [];
% for i = 1:5:1024
%     for j = 1:5:1280
%         if bmag_45(i,j) == 1
%             xi = [xi;j];
%             yi = [yi; i];
%         end
%     end
% end
% %% m>0 blue line
% T = 0.5;
% cnt = 0;
% c_max = 0;
% m_max = 0;
% n_max = 0;
% for i=1:1:1000
%     ids = randperm(length(xi),2);
%     
%     sxi = xi(ids);
%     syi = yi(ids);
% 
%     %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
%     m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
%     n = -m*sxi(1)+syi(1);
%     syi_=m*sxi+n;
%     for i=1:1:length(xi)
%         if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
%             cnt = cnt + 1;
%         end
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
% m_max_45=m_max;
% xi_45 = xi;
% yi_45 = m_max*xi + n_max;
% %plot(xi_,yi_1,'b-'); axis equal;
% %% final
% figure; imshow(I); 
% hold on; plot(xi_45,yi_45,'b-'); axis equal;
% %% 135
% 
% xi = [];
% yi = [];
% for i = 1:5:1024
%     for j = 1:5:1280
%         if bmag_135(i,j) == 1
%             xi = [xi;j];
%             yi = [yi; i];
%             %plot(j,i,'go');
%         end
%     end
% end
% %% m>0 blue line
% T = 0.5;
% cnt = 0;
% c_max = 0;
% m_max = 0;
% n_max = 0;
% for i=1:1:1000
%     ids = randperm(length(xi),2);
%     sxi = xi(ids);
%     syi = yi(ids);
% 
%     %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
%     m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
%     n = -m*sxi(1)+syi(1);
%     syi_=m*sxi+n;
%     for i=1:1:length(xi)
%         if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
%             cnt = cnt + 1;
%         end
%     end
%     if(cnt > c_max)
%         if(m > 0.5 && m < 3)
%             m_max = m;
%             n_max = n;
%             c_max = cnt;
%         end
%     end
%     cnt = 0;
% end
% xi_135 = xi;
% yi_135 = m_max*xi + n_max;
% %plot(xi_,yi_1,'b-'); axis equal;
% %% final
% figure; imshow(I); 
% hold on; plot(xi_135,yi_135,'b-'); axis equal;
% %% 45a
% xi = [];
% yi = [];
% for i = 1:5:1024
%     for j = 1:5:1280
%         if bmag_45(i,j) == 1
%             xi = [xi;j];
%             yi = [yi; i];
%             %plot(j,i,'go');
%         end
%     end
% end
% %% m>0 blue line
% T = 0.5;
% cnt = 0;
% c_max = 0;
% m_max = 0;
% n_max = 0;
% for i=1:1:1000
%     ids = randperm(length(xi),2);
%     
%     sxi = xi(ids);
%     syi = yi(ids);
% 
%     %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
%     m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
%     n = -m*sxi(1)+syi(1);
%     syi_=m*sxi+n;
%     for i=1:1:length(xi)
%         if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
%             cnt = cnt + 1;
%         end
%     end
%     if(cnt > c_max)
%         if(m < -0.5 && m>-5 && m_max_45 ~= m)
%             m_max = m;
%             n_max = n;
%             c_max = cnt;
%         end
%     end
%     cnt = 0;
% end
% xi_45a = xi;
% yi_45a = m_max*xi + n_max;
% %plot(xi_,yi_1,'b-'); axis equal;
% %% final
% figure; imshow(I); 
% hold on; plot(xi_45a,yi_45a,'r-'); axis equal;
%% 135a
%% 45a
xi = [];
yi = [];
for i = 1:5:1024
    for j = 1:5:1280
        if bmag_45(i,j) == 1
            xi = [xi;j];
            yi = [yi; i];
            %plot(j,i,'go');
        end
    end
end
%% m>0 blue line
T = 0.5;
cnt = 0;
c_max = 0;
m_max = 0;
n_max = 0;
for i=1:1:1000
    ids = randperm(length(xi),2);
    
    sxi = xi(ids);
    syi = yi(ids);

    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    for i=1:1:length(xi)
        if((abs(m*xi(i)+n - yi(i)))/(1+m.^2) < T)
            cnt = cnt + 1;
        end
    end
    if(cnt > c_max)
        if(m > 0.5 && m<5 )
            m_max = m;
            n_max = n;
            c_max = cnt;
        end
    end
    cnt = 0;
end
xi_135a = xi;
yi_135a = m_max*xi + n_max;
%plot(xi_,yi_1,'b-'); axis equal;

%% final
%figure; imshow(I); 
%hold on; plot(xi_135a,yi_135a,'r-'); axis equal;
%% FINAL
hold on;
%hold on; plot(xi_45,yi_45,'b-'); axis equal;
%hold on; plot(xi_135,yi_135,'b-'); axis equal;
%hold on; plot(xi_45a,yi_45a,'r-'); axis equal;
hold on; plot(xi_135a,yi_135a,'r-'); axis equal;