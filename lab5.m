%lab5
I=imread('/MATLAB Drive/standard_test_images/house.tif');
I=I(:,:,1);
% Converts the image to grayscale by keeping only the first channel.
corners= corner(I);
%Detects corners in the grayscale image and stores their coordinates in the variable corners.
%figure;%1
%imshow(I);
hold on
%Enables overlaying subsequent plots on the same figure.
plot(corners(:,1),corners(:,2),'r*');
%Plots red asterisks at the corner coordinates on the image.

I = im2gray(I);
corners = detectHarrisFeatures(I);
%Detects corners in the grayscale image I 
% using the Harris corner detection algorithm
% and stores the corner information in corners.
%figure;%2
%imshow(I);
hold on;
plot(corners.selectStrongest(50));
%Plots the 50 strongest corners on the image.


img = imread('/MATLAB Drive/standard_test_images/test.jpg');
if length(size(img))>2
img = rgb2gray(img);
end
%%applying sobel edge detector in the horizontal direction
fx = [-1 0 1;-1 0 1;-1 0 1];
Ix = filter2(fx,img);
% applying sobel edge detector in the vertical direction
fy = [1 1 1;0 0 0;-1 -1 -1];
Iy = filter2(fy,img);
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;
%applying gaussian filter on the computed value
h= fspecial('gaussian',[7 7],2);
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
height = size(img,1);
width = size(img,2);
result = zeros(height,width);
R = zeros(height,width);
Rmax = 0;
for i = 1:height
for j = 1:width
M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];
R(i,j) = det(M)-0.01*(trace(M))^2;
if R(i,j) > Rmax
Rmax = R(i,j);
end
end
end
cnt = 0;
for i = 2:height-1
for j = 2:width-1
if R(i,j) > 0.1*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
result(i,j) = 1;
cnt = cnt+1;
end
end
end
[posc, posr] = find(result == 1);
cnt ;
%figure;%3
%imshow(img);
hold on;
plot(posr,posc,'r*');

%%%% Read an image into the workspace and, to make this example more illustrative, rotate the 
%image. Display the image.
I = imread('/MATLAB Drive/circuit.tif');
rotI = imrotate(I,33,'crop');
%figure;
%imshow(rotI)
%%% Find the edges in the image using the edge function.
BW = edge(rotI,'canny');
%figure;%4
%imshow(BW);
%%% Compute the Hough transform of the binary image returned by edge.
[H,theta,rho] = hough(BW);
%%% Display the transform, H, returned by the hough function.
figure;%5
imshow(imadjust(rescale(H)),[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
colormap(gca,hot)
%%%%% Find the peaks in the Hough transform matrix, H, using the houghpeaks function.
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%%% Superimpose a plot on the image of the transform that identifies the peaks.
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
%%%% Find lines in the image using the houghlines function.
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
%%%Create a plot that displays the original image with the lines superimposed on it.
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 % Plot beginnings and ends of lines
 plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
 plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% Determine the endpoints of the longest line segment
 len = norm(lines(k).point1 - lines(k).point2);
 if ( len > max_len)
 max_len = len;
 xy_long = xy;
 end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');


%Q!
% Read the image
I = imread('cube.jpeg');

% Convert the image to grayscale
I_gray = rgb2gray(I);

% Detect corners using the Harris corner detection method
corners = detectHarrisFeatures(I_gray);
figure;
% Display the image
imshow(I);

% Overlay the corners on the image
hold on;
plot(corners.selectStrongest(50));

%Q2
I = imread('images (4).jfif');
I_gray = rgb2gray(I);

% Apply the Harris corner detector to the original image
% and obtain the corner coordinates
corners_original = detectHarrisFeatures(I_gray);
coords_original = corners_original.Location;

% Add noise to the image
noisy_image = imnoise(I_gray, 'gaussian', 0, 0.01);

% Apply the Harris corner detector to the noisy image and obtain the corner coordinates
corners_noisy = detectHarrisFeatures(noisy_image);
coords_noisy = corners_noisy.Location;


% Visualize the results
figure;%9
imshow(I);
hold on;
plot(coords_original(:, 1), coords_original(:, 2), 'r*');
title('Original Image with Detected Corners');
hold off;

figure;%10
imshow(noisy_image);
hold on;
plot(coords_noisy(:, 1), coords_noisy(:, 2), 'g*');
title('Noisy Image with Detected Corners');
hold off;

% Apply median filtering to remove noise
denoised_image = medfilt2(noisy_image);

% Define the sigma value for Gaussian filtering
sigma = 1; % قم بضبط القيمة حسب الحاجة

% Apply Gaussian filtering to the denoised image
filtered_image = imgaussfilt(denoised_image, sigma);

% Display the filtered image
figure;%11
subplot(1, 2, 1);
imshow(filtered_image);
title('Filtered Image');

% Define the size of the median filter
filter_size = 3; % Adjust the value as needed

% Apply median filtering to the noisy image
denoised_image = imfilter(noisy_image, ones(filter_size) / filter_size^2);

% Display the denoised image

subplot(1, 2, 1);
imshow(denoised_image);
title('Denoised Image');

