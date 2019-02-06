%% Read image
clear
f = im2double(imread('sample.bmp'));

%% Display image
imshow(f,[]);title('Original image');


%% Edge Detection
% [g, t] = edge(f, 'method', parameters);

%% Sobel Edge Detection 
%   automatic threshold
[v, t] = edge(f, 'sobel' , 'vertical');
imshow(v);title(sprintf('Sobel Edge Dectection [auto vertical t = %0.2f]',t));
pause

%   manual threshold
t = 0.15;
v = edge(f, 'sobel', t, 'vertical');
imshow(v);title(sprintf('Sobel Edge Dectection [manual vertical t = %0.2f]',t));
pause

%   Sobel edge +45 degree
w = [-2 -1 0; -1 0 1; 0 1 2];
v = imfilter(f, w, 'replicate');
t = 0.3*max(abs(v(:)));
v = v >= t;
imshow(v);title(sprintf('Sobel Edge Dectection [manual +45 t = %0.2f]',t));
pause

%   Sobel edge -45 degree
w = [0 1 2; -1 0 1; -2 -1 0];
v = imfilter(f, w, 'replicate');
t = 0.3*max(abs(v(:)));
v = v >= t;
imshow(v);title(sprintf('Sobel Edge Dectection [manual -45 t = %0.2f]',t));
pause

%% Other methods
% Sobel
v0 = edge(f, 'sobel');
imshow(v0);title('Sobel Edge Dectection [auto]');
pause

% Prewitt
v1 = edge(f, 'prewitt');
imshow(v1);title('Prewitt Edge Dectection [auto]');
pause

% Roberts
v2 = edge(f, 'roberts');
imshow(v2);title('Roberts Edge Dectection [auto]');
pause

% Laplacian of Gaussian Method
v3 = edge(f, 'log');
imshow(v3);title('Laplacian of Gaussian Method [auto]');
pause

% Zero-cross
v4 = edge(f, 'zerocross');
imshow(v4);title('Zero-cross Method [auto]');
pause

% Canny
v5 = edge(f, 'canny');
imshow(v5);title('Canny Edge Dectection [auto]');
pause

subplot(231);imshow(v0);title('Sobel Edge Dectection [auto]');
subplot(232);imshow(v1);title('Prewitt Edge Dectection [auto]');
subplot(233);imshow(v2);title('Roberts Edge Dectection [auto]');
subplot(234);imshow(v3);title('Laplacian of Gaussian Method [auto]');
subplot(235);imshow(v4);title('Zero-cross Method [auto]');
subplot(236);imshow(v5);title('Canny Edge Dectection [auto]');