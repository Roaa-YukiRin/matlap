%proplem lab7
%Q1
LRGB = imread("/MATLAB Drive/standard_test_images/lena_color_256.tif");

% Compute grayscale image using simple average
gray_simple = uint8(mean(LRGB, 3));

% Compute grayscale image using weighted average
weights = [0.2989, 0.5870, 0.1140];
weights = reshape(weights, 1, 1, 3); % Reshape weights to match LRGB dimensions
gray_weighted = uint8(sum(double(LRGB) .* weights, 3));

% Compute grayscale image using rgb2gray
gray_rgb2gray = rgb2gray(LRGB);

% Display the images
figure;

subplot(4, 3, 2);
imshow(LRGB);
title('Original RGB Image');

subplot(4, 3, 5);
imshow(gray_simple);
title('Grayscale Image (Simple Average)');

subplot(4, 3, 8);
imshow(gray_weighted);
title('Grayscale Image (Weighted Average)');

subplot(4, 3, 11);
imshow(gray_rgb2gray);
title('Grayscale Image (rgb2gray)');

%q2
% Read the Lena image
Lena = imread("/MATLAB Drive/standard_test_images/lena_color_256.tif");

% Convert Lena image to YIQ color space
YIQ = rgb2ntsc(Lena);

% Extract the Y component
Y = YIQ(:,:,1);

% Part (a): Apply Laplacian filter to the Y component
laplacian_filtered = imfilter(Y, fspecial('laplacian'));

% Part (b): Apply Gaussian filter to the Y component
gaussian_filtered = imgaussfilt(Y);

% Part (c): Apply Sobel operator to the Y component
sobel_filtered = edge(Y, 'Sobel');

% Part (d): Apply Harris corner detector to the Y component
harris_filtered = corner(Y);

% Convert the filtered Y component back to RGB
YIQ_filtered = cat(3, laplacian_filtered, YIQ(:,:,2), YIQ(:,:,3));
RGB_filtered = ntsc2rgb(YIQ_filtered);

% Display the output images
figure;

subplot(3, 3, 2);
imshow(Lena);
title('Original RGB Image');

subplot(3, 3, 5);
imshow(laplacian_filtered);
title('Laplacian Filtered (Y Component)');
xlabel('Laplacian Filter');

subplot(3, 3, 8);
imshow(gaussian_filtered);
title('Gaussian Filtered (Y Component)');
xlabel('Gaussian Filter');

figure;
subplot(2, 3, 2);
imshow(sobel_filtered);
title('Sobel Filtered (Y Component)');
xlabel('Sobel Operator');

subplot(2, 3, 5);
imshow(RGB_filtered);
title('Filtered RGB Image');
xlabel('Y Component Filtered');

% Create a new figure for the scatter plot
figure;
scatter(harris_filtered(:,1), harris_filtered(:,2), 'r.', 'SizeData', 50); % Increase the marker size to 50
title('Harris Filtered (Y Component)');
xlabel('Harris Corner Detector');

% Explanation:
% - Part (a): The Laplacian filter enhances edges and fine details in the Y component of the image.
% - Part (b): The Gaussian filter smooths the Y component of the image, reducing noise and blurring details.
% - Part (c): The Sobel operator detects edges in the Y component of the image.
% - Part (d): The Harris corner detector identifies corners and points of interest in the Y component of the image.
% - The filtered Y component is combined with the original U and V components to obtain the filtered RGB image.

% Convert Lena image to grayscale
grayLena = rgb2gray(Lena);

% Apply Harris corner detector to the grayscale image
corners = detectHarrisFeatures(grayLena);

% Display the original image with corner points
figure;
imshow(Lena);
title('Original Image');
hold on;
plot(corners.Location(:,1), corners.Location(:,2), 'r.', 'MarkerSize', 50);
hold off;

% Explanation:
% - The grayscale version of the Lena image is used for the Harris corner detection.
% - The detectHarrisFeatures function identifies corner points in the image.
% - The original image is then displayed with the corner points overlaid as red dots.