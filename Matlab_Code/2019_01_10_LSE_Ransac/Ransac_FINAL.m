close all; clc; clear all;

% 직선의 파라미터 선정
% y = ax + b;
a = 2;
b = 10;

% 직선을 구성하는 점들 생성
xi = -10:1:10;
yi = a*xi + b;

% 직선을 구성하는 점들에 노이즈 추가
stdv = 1;
xi = xi + stdv*randn(1,length(xi));
yi = yi + stdv*randn(1,length(yi));

%Outlier 포함 하기
xi(1) = 40;
yi(1) = 20;

figure; plot(xi,yi,'bx'); axis equal;

T = 1;
cnt = 0;
c_max = 0;
f=0;
d=0;
for i=1:1:300
    id = randperm(length(xi),2);
    
    %hold on; plot(xi(id),yi(id),'ro');axis equal;
    sxi = xi(id);
    syi = yi(id);

    %y=mx+n 램덤으로 뽑은 두 점으로 그래프 그리기
    m=(syi(2)-syi(1))/(sxi(2)-sxi(1));
    n = -m*sxi(1)+syi(1);
    syi_=m*sxi+n;
    %hold on; plot(sxi,syi,'b-');
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
yi_ = m_max*xi + n_max;
figure; plot(xi,yi,'bx');
hold on; plot(xi,yi_,'r-');axis equal;