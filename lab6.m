I = imread('black_bridge_bw.tif');
imshow(I);

% Define a structuring element (SE)
se = strel('disk', 5); % Example: disk-shaped SE with radius 5

% Perform morphological operations
erodedImage = imerode(I, se);
dilatedImage = imdilate(I, se);
openedImage = imopen(I, se);
closedImage = imclose(I, se);

% Display the results
figure;
subplot(2,2,1); imshow(erodedImage); title('Eroded Image');
subplot(2,2,2); imshow(dilatedImage); title('Dilated Image');
subplot(2,2,3); imshow(openedImage); title('Opened Image');
subplot(2,2,4); imshow(closedImage); title('Closed Image');