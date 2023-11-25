%Q1
[image, map] = imread('standard_test_images/lena_color_256.tif');
%This line reads an image file named 'lena_color_256.tif' 
% and stores the image data in the variable image. 
% If the image contains an indexed image,
% the colormap will be stored in the variable map

im_gray = rgb2gray(image);
%This line converts the RGB image (image) to grayscale 
% using the rgb2gray function and stores the result in im_gray.

imgGN = imnoise(im_gray, "gaussian");
%This line adds Gaussian noise to the grayscale image (im_gray)
% using the imnoise function with the noise type specified as "gaussian".
% The resulting noisy image is stored in imgGN.

imgSP = imnoise(im_gray, 'salt & pepper');
%This line adds salt-and-pepper noise
% to the grayscale image (im_gray)
% using the imnoise function with the noise type specified
% as "salt & pepper". The resulting noisy image is stored in imgSP.

kernel = ones(5, 5) / 25;
denoise = conv2(double(imgSP), kernel, 'same');
%These lines create a 5x5 averaging kernel (kernel),
% convert the noisy image (imgSP) to a 2D array of type double,
% and perform convolution between the noisy image and the kernel
% using the conv2 function. T
% he 'same' option ensures that the output size
% is the same as the input size. 
% The resulting denoised image is stored in denoise.

h = fspecial("average", 5);
denoise1 = imfilter(imgSP, h);
%These lines create a 5x5 averaging filter
% (h) using the fspecial function 
% and apply the filter to the noisy image (imgSP)
% using the imfilter function.
% The resulting denoised image is stored in denoise1.

figure, montage({im_gray, imgGN, imgSP, uint8(denoise), denoise1});
%This line creates a new figure
% and displays a montage of images for comparison.
% The montage includes the original grayscale image (im_gray),
% the image with added Gaussian noise (imgGN),
% the image with added salt-and-pepper noise (imgSP),
% the denoised image obtained through convolution (denoise),
% and the denoised image obtained through filtering (denoise1).


%q2
[image, map] = imread('standard_test_images/lena_color_256.tif');
im_gray = rgb2gray(image);

im_noisy = imnoise(im_gray, 'salt & pepper');
% Add salt-and-pepper noise

weights = [0, -1/4, 0; -1/4, 2, -1/4; 0, -1/4, 0];
% Custom filter weights
se = strel('arbitrary', weights);
% Structuring element for minimum and maximum filters

im_denoised_min = imerode(im_noisy, se);
% Remove noise using minimum filter

im_denoised_max = imdilate(im_noisy, se);
% Remove noise using maximum filter

figure,
montage({im_gray, im_noisy, im_denoised_min, im_denoised_max});

%q3
[image, map] = imread('standard_test_images/lena_color_256.tif');
im_gray = rgb2gray(image);

% Apply Gaussian smoothing
gaussian_filtered = imgaussfilt(im_gray, 2); 
% Adjust the standard deviation as desired

% Subtract low-pass filtered image from the original image
sharpened = im_gray - gaussian_filtered;

% Display the original image and the sharpened image
figure;
subplot(1, 2, 1);
imshow(im_gray);
title('Original Image');
subplot(1, 2, 2);
imshow(sharpened);
title('Sharpened Image');
