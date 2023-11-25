
g1=imread("/MATLAB Drive/standard_test_images/lena_gray_256.tif");
g2=imread("/MATLAB Drive/standard_test_images/mandril_gray.tif");
% read file from decimnt
%[g1,map]=imread("/MATLAB Drive/standard_test_images/lena_gray_256.tif");
%[g1,map]=imread("/MATLAB Drive/standard_test_images/mandril_gray.tif");

%whos
%g3=double(g1)+double(g2);

% Display the original images
figure;
subplot(2, 2, 1);
imshow(g1);
title('Image 1');
subplot(2, 2, 2);
imshow(g2);
title('Image 2');

% Resize g2 to match the size of g1
g2_resized = imresize(g2, size(g1));

% Convert the images to double precision for arithmetic operations
g1_double = double(g1);
g2_double = double(g2_resized);

% Perform binary operations
sum_result = g1_double + g2_double;
mult_result = g1_double .* g2_double;
sub_result = g1_double - g2_double;

% Display the results
subplot(2, 2, 3);
imshow(sum_result, []);
title('Summation');
subplot(2, 2, 4);
imshow(mult_result, []);
title('Multiplication');

figure;
imshow(sub_result, []);
title('Subtraction');
% Perform binary operations
sum_result = g1_double + g2_double;
mult_result = g1_double .* g2_double;
sub_result = g1_double - g2_double;

% Display the results
subplot(2, 2, 3);
imshow(sum_result, []);
title('Summation');
subplot(2, 2, 4);
imshow(mult_result, []);
title('Multiplication');

figure;
imshow(sub_result, []);
title('Subtraction');

%q2
%gr=imread('8dd58e1aa720db90851b2440adfb57af5e449b91_hq.jpg');
%imshow(gr);
%I_gray=rgb2gray(gr);
%imshow(I_gray);

% Read grayscale image
I_gray = imread('8dd58e1aa720db90851b2440adfb57af5e449b91_hq.jpg');

% Display grayscale image
imshow(I_gray);
title('Grayscale Image');

% Calculate and display histogram
figure;
imhist(I_gray);
title('Histogram of Grayscale Image');