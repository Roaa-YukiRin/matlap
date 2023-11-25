I = imread("standard_test_images/woman_blonde.tif");
imshow(I);%figur1
k_x = fspecial('sobel');
%Creates a Sobel filter kernel and stores it in k_x..
k_y = k_x';
% Transposes k_x to create a 
% vertical Sobel filter kernel and stores it in k_y.
g_x = imfilter(I, k_x);
%Applies the horizontal Sobel filter to 
% the image I using imfilter and stores the result in g_x.
g_y = imfilter(I, k_y);
%Applies the vertical Sobel filter
% to the image I using imfilter and stores the result in g_y.
figure, montage({g_x, g_y})%figur2

edge1=edge(I,'prewitt');
%Applies the Prewitt edge detection method to the image I and stores the result in edge1.
edge2 =edge(I,'canny');
%Applies the Canny edge detection method to the image I and stores the result in edge2.
figure;%fgure3
subplot(1, 2, 1), imshow(edge2), title('canny');
subplot(1, 2, 2), imshow(edge1), title('Prewitt');


% Apply edge detection using different methods
BW1 = edge(I, 'Sobel');
BW2 = edge(I, 'Prewitt');
BW3 = edge(I, 'Roberts');
BW4 = edge(I, 'log');
BW5 = edge(I, 'zerocross');
BW6 = edge(I, 'Canny');
BW7 = edge(I, 'approxcanny');

% Display the results
figure;%fgure3
subplot(2, 2, 1), imshow(BW1), title('Sobel');
subplot(2, 2, 2), imshow(BW2), title('Prewitt');
subplot(2, 2, 3), imshow(BW3), title('Roberts');
figure;%fgure3
subplot(2, 2, 1), imshow(BW4), title('LoG');
subplot(2, 2, 2), imshow(BW5), title('Zero Crossing');
subplot(2, 2, 3), imshow(BW6), title('Canny');
subplot(2, 2, 4), imshow(BW7), title('Approximate Canny');
