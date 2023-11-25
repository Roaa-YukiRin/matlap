I5=imread("8dd58e1aa720db90851b2440adfb57af5e449b91_hq.jpg");
imshow(I5);
% To display the image the image
I_gray2=rgb2gray(I5);
imshow(I_gray2);
%To display the grayscale image
[X,Y]=size(I_gray2);
%To find the size of  (I_gray2)

I6=imresize(I_gray2,0.25);
imshow(I6);
%to shnge the size of I_gray2)
I7=imresize(I_gray2,[214,217]);
imshow(I7);
%mor informaton of the size
% to a specific size of 214x217 pixels 
% and assigns the resized image to the variable I7.
figure,
subplot(1,2,1),imshow(I5)
subplot(1,2,2),imshow(I_gray2)
%To show 2 pectsher in same page

[height, width] = size(I7);
center_x = floor((width + 1) / 2);  % Use floor to get integer index
center_y = floor((height + 1) / 2);  % Use floor to get integer index

% Check if the center coordinates are within the valid range
if center_x >= 1 && center_x <= width && center_y >= 1 && center_y <= height
    %This condition checks if both the x and y coordinates 
    % of the center pixel (center_x and center_y) are within the valid range.
    % The valid range is determined by the width and height of the image I7.
    center_pixel_value = I7(center_y, center_x);
    %If the condition is true, 
    % this line of code retrieves the pixel value 
    % from the I7 image at the specified center position (center_y, center_x). 
    % The center_y and center_x indices are used to access the pixel value
    disp(center_pixel_value);
    %After retrieving the center pixel value,
    % this line of code displays it in the MATLAB command window using the disp function.
else
    disp("Center coordinates are outside the valid range.");
    %If the center coordinates are not within the valid range
    % , this code block is executed. 
    % Displays the message
    % "Center coordinates are outside the valid range".
    % In the MATLAB command window using the disp function.
end