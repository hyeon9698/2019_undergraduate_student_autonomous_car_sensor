I=imread('sample.bmp'); %         Input image file here
dim = size(I); % Get size of the image and store in an array called 'dim'.%size array matrix; 1 is height, 2 is width

I2 = rgb2gray(I); % Convert to grayscale
BW = edge(I2,'canny',[]); % Edge detection using Canny
cc = bwconncomp(BW);
I4 = labelmatrix(cc);

a_rp = regionprops(cc,'Area','MajorAxisLength','MinorAxislength','Orientation','PixelList','Eccentricity');
idx = ([a_rp.Eccentricity] > 0.99 & [a_rp.Area] > 100 & [a_rp.Orientation] < 60 & [a_rp.Orientation] > -90);

BW2 = ismember(I4,find(idx));
[H,T,R] = hough(BW2);

%  figure, imshow(H,[], 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
%  xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,50,'threshold',ceil(0.1*max(H(:))));

% Set houghpeaks parameters, threshold unsure
x = T(P(:,2));
y = R(P(:,1));
plot(x,y,'s','color','white');

% Apply median filtering
I3 = medfilt2(I2);

% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',20,'MinLength',10);
figure, imshow(I3),imagesc(I3), hold on
max_len = 0;

for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

    % plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

showlines = struct(lines);
cellData = struct2cell(showlines);

% X-coordinates are for width
% Y-coordinates are for height
%point1(x y) etc

for i = 1:280
    % 'A' stores all 'x' coordinates of point 1
    A([i,i+1])= [cellData{1,i}];
    % 'B' stores all 'x' coordinates of point 2
    B([i,i+1])= [cellData{2,i}];
    % 'C' stores all 'y' coordinates of point 1
    C([i,i])= [cellData{1,i}];
    % 'D' stores all 'y' coordinates of point 2
    D([i,i])= [cellData{2,i}];
end