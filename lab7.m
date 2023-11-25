LRGB = imread("/MATLAB Drive/standard_test_images/lena_color_256.tif");
fR = zeros(size(LRGB, 1), size(LRGB, 2), size(LRGB, 3), 'uint8');
fG = zeros(size(LRGB, 1), size(LRGB, 2), size(LRGB, 3), 'uint8');
fB = zeros(size(LRGB, 1), size(LRGB, 2), size(LRGB, 3), 'uint8');

fR(:, :, 1) = LRGB(:, :, 1);
fG(:, :, 2) = LRGB(:, :, 2);
fB(:, :, 3) = LRGB(:, :, 3);

figure;
subplot(2, 2, 1);
imshow(LRGB);
title('Original Image');

subplot(2, 2, 2);
imshow(fR);
title('Red Channel');

subplot(2, 2, 3);
imshow(fG);
title('Green Channel');

subplot(2, 2, 4);
imshow(fB);
title('Blue Channel');

%%%%Colors CMY planes%%%%%
% Create custom color matrices for CMY planes
C = cat(3, zeros(size(LRGB, 1), size(LRGB, 2)), 255 - LRGB(:, :, 2), 255 - LRGB(:, :, 3));
M = cat(3, 255 - LRGB(:, :, 1), zeros(size(LRGB, 1), size(LRGB, 2)), 255 - LRGB(:, :, 3));
Y = cat(3, 255 - LRGB(:, :, 1), 255 - LRGB(:, :, 2), zeros(size(LRGB, 1), size(LRGB, 2)));

% Display the CMY color planes
figure;
subplot(2, 2, 1);
imshow(LRGB); 
title('Original Image');

subplot(2, 2, 2);
imshow(C);
title('Cyan Plane');

subplot(2, 2, 3);
imshow(M);
title('Magenta Plane');

subplot(2, 2, 4);
imshow(Y);
title('Yellow Plane');

%Conversion between RGB and YIQ 
% Use rgb2ntsc () to convert RGB to YQI
% ntsc2rgb() to convert YIQ to RGB

% Convert RGB to YIQ
YIQ = rgb2ntsc(LRGB);

% Convert YIQ back to RGB
RGB = ntsc2rgb(YIQ);

% Convert RGB to grayscale
gray = rgb2gray(LRGB);

% Enhance grayscale image
enhanced_gray = imadjust(gray);

% Display the images
figure;

subplot(3, 3, 1);
imshow(LRGB);
title('Original RGB Image');

subplot(3, 3, 3);
imshow(RGB);
title('RGB Image after Conversion');

subplot(3, 3, 4);
imshow(gray);
title('Grayscale Image');

subplot(3, 3, 6);
imshow(enhanced_gray);
title('Enhanced Grayscale Image');

subplot(3, 3, 7);
imshow(enhanced_gray);
title('_    Enhanced Grayscale Image (More Contrast)');

subplot(3, 3, 9);
imshow(LRGB);
title('Original RGB Image');

% Convert RGB to YIQ
fYIQ = rgb2ntsc(LRGB);
Y = fYIQ(:,:,1);

% Enhance Y channel using histogram equalization
New_Y = histeq(Y);

% Create a new YIQ image with the enhanced Y channel
New_YIQ = fYIQ;
New_YIQ(:,:,1) = New_Y;

% Convert the enhanced YIQ image back to RGB
New_RGB = ntsc2rgb(New_YIQ);

% Display the images
figure;

subplot(3, 3, 1);
imshow(LRGB);
title('Original RGB Image');

subplot(3, 3, 3);
imshow(fYIQ);
title('YIQ Image');

subplot(3, 3, 4);
imshow(Y);
title('Y Channel');

subplot(3, 3, 6);
imshow(New_Y);
title('Enhanced Y Channel');

subplot(3, 3, 7);
imshow(New_YIQ);
title('Enhanced YIQ Image');

subplot(3, 3, 9);
imshow(New_RGB);
title('Enhanced RGB Image');