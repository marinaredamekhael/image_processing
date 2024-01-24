% Read the image
clear
clc
close all
img = imread('land.jpg'); 

% Convert the image to double for processing
img_double = im2double(img);

% Reduce contrast by scaling the pixel values
% Here, we scale the pixel values to be closer to the mid-range (0.5)
contrastFactor = 0.5; % Adjust this factor to control the amount of contrast reduction
low_contrast_img = img_double * contrastFactor + (1 - contrastFactor) * 0.5;

% Convert back to uint8 if necessary
low_contrast_img_uint8 = im2uint8(low_contrast_img);

% Display the original and low contrast image
figure(40), imshow(img), title('Original Image');
figure(41), imshow(low_contrast_img_uint8), title('Low Contrast Image');
