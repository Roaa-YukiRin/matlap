I=imread("standard_test_images/kingdom hearts 0.jfif");
imshow(I);
I_gray=rgb2gray(I);
imshow(I_gray);
[X,Y]=size(I_gray);

I2=imresize(I_gray,0.5);
I3=imresize(I_gray,[267,189]);

figure,
subplot(1,2,1),imshow(I)
subplot(1,2,2),imshow(I_gray)

II=rand(100);
imwrite(II,'new_image.jpg');

imfinfo('new_image.jpg');

imtool(I);
I4=imresize(I_gray,0.25);
imshow(I4);