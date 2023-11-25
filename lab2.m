%lab2
[img,map]=imread("reader.jpg");

%The imread function is used to read the image,
% and it returns two outputs: img and map. img represents the image data,
% while map contains the colormap if the image is indexed.
img= double(img);
%This line converts the image img from the default data type to double precision.
% By converting it to double, 
% the pixel values of the image will be represented as floating-point numbers.
imgU= sqrt(img);
%This line calculates the square root
% of each pixel value in the img image.
% The sqrt function is applied element-wise to the image matrix,
% resulting in a new image imgU where each pixel value is the square root of the corresponding pixel value in the original image.
max(imgU(:))
%This line finds the maximum value in the imgU image.
% The (:) syntax is used to linearize the image into a column vector, 
% allowing the max function to find the maximum value across all the pixels in the image.
imagesc(imgU);
%This line of code allows you
% to visually inspect the imgU image 
% and observe the effect of the square root transformation on the pixel intensities.
% It provides a visual representation of the image, making it easier to analyze and interpret the data.
colormap(gray)
%By executing colormap(gray);,
% the current figure or axes will use the grayscale colormap,
% and any subsequent image
% or plot displayed will be mapped to the grayscale color scale. 
% This can be useful for visualizing grayscale images
% or displaying data where the grayscale color scheme is appropriate.

imshow(imgU)
%This line uses the imshow function
% to display the image imgU. 
% The imshow function automatically scales
% the intensity values of the image
% to fit the display range.
% It adjusts the colormap and color scaling
% based on the minimum and maximum values in imgU.
% By default, it uses the "truecolor" display mode for RGB images
% or the grayscale display mode for grayscale images.

imshow(imgU,[])
% This line also uses the imshow function,
% but with an additional argument [].
% The [] argument is used to specify the display range.
% When [] is passed, 
% MATLAB automatically scales the intensity values of imgU to the full display range.
% In other words, 
% it adjusts the colormap and color scaling 
% based on the minimum and maximum values in imgU to utilize the full dynamic range of the colormap.

image(imgU)
%This line uses the image function to display the image imgU.
% The image function is similar to imshow and can be used to display images.
% However, unlike imshow, the image function does not automatically adjust the colormap or color scaling.
% You would need to manually set the colormap and color scaling
% using the colormap function or by specifying additional arguments to the image function.

[img1,map]=imread("Ex1.jfif");
[img2,map]=imread("ex-rank-supporting-roles-replay-in-a-prestigious-school.jpg");
%read from file
%The resulting image data is stored in img1 and img2, and the colormap (if present) is stored in map.
whos
%This command displays information about the variables currently in the workspace.
%It shows details such as the name, size, bytes, and class of each variable.
outputSize = size(img1, [1, 2]);
%The size function is used to determine the dimensions of img1.
%the [1, 2] argument specifies that we want to retrieve the size in the first and second dimensions (height and width) of img1.
%The resulting size is assigned to the outputSize variable.

img2 = imresize(img2, outputSize);
%The imresize function is used to resize img2 to match the dimensions of img1.
% The outputSize variable,
% which contains the desired dimensions, 
% is passed as the second argument to imresize.
% This ensures that img2 is resized to have the same size as img1
size(img2)
%This line displays the size of img2 after the resizing operation.
% It shows the dimensions (height, width, and color channels) of the resized img2.
img =double(img1)+double(img2);
%The double function is used to convert img1 and img2 from the original data type (likely uint8) to double precision.
% This conversion allows for performing element-wise addition between the two images.
% The resulting sum is stored in the img variable.
imagesc(img),colormap("gray")
%The imagesc function is used to display the img variable as an image. 
% The colormap("gray") command sets the colormap to grayscale,
% so the image is displayed in shades of gray.



I=imread("standard_test_images/Ex-Rank-Supporting-Roles-Replay-in-a-Prestigious-School.png");
I_gray=rgb2gray(I);
imshow(I_gray);
H = gca;  % Get the handle to the current axes containing the image
imageData = getimage(H);  % Get the image data from the handle
imshow(imageData);  % Display the image data

I1=imread('/MATLAB Drive/standard_test_images/lena_color_256.tif');

I1_gray=rgb2gray(I1);
imshow(I1_gray);

H_Equ=histeq(I1_gray);
%The histeq function performs histogram equalization
% on the grayscale image I1_gray.
% Histogram equalization enhances the contrast
% of the image by redistributing pixel intensities.
imshow(H_Equ)

H1=imhist(H_Equ);
%The imhist function is used to compute the histogram
% of the equalized image H_Equ.
% The histogram represents the frequency distribution 
% of pixel intensities in the image.
imshow(H1);





