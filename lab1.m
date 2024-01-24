clear
clc
close all
img = imread('land.jpg');
figure(1); imshow(img); title('original image');

% Separate the color channels
redChannel = img(:, :, 1);
greenChannel = img(:, :, 2);
blueChannel = img(:, :, 3);

% Display each channel in separate figures
figure(2); imshow(redChannel); title('Red Channel');
figure(3); imshow(greenChannel); title('Green Channel');
figure(4); imshow(blueChannel); title('Blue Channel');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

edgeKernel_Laplacian= [-1 -1 -1; -1 8 -1; -1 -1 -1]; %Laplacian kernel
sharpenKernel = [0 -1 0; -1 5 -1; 0 -1 0]; % Sharpening kernel


convolvedRed = conv2(redChannel, edgeKernel_Laplacian, 'same');
convolvedGreen = conv2(greenChannel, edgeKernel_Laplacian, 'same');
convolvedBlue = conv2(blueChannel, edgeKernel_Laplacian, 'same');

figure(5); imshow(convolvedRed); title('LaplacianconvolvedRed Image');
figure(6); imshow(convolvedGreen); title('LaplacianconvolvedGreen Image');
figure(7); imshow(convolvedBlue); title('LaplacianconvolvedBlue Image');

% Combine the channels back into an RGB image
convolvedImage = uint8(cat(3, convolvedRed, convolvedGreen, convolvedBlue));

% Display the result
figure(8); imshow(convolvedImage); title('LaplacianConvolved Image');

%%%%%%%%%
convolvedRed = conv2(redChannel, sharpenKernel, 'same');
convolvedGreen = conv2(greenChannel, sharpenKernel, 'same');
convolvedBlue = conv2(blueChannel, sharpenKernel, 'same');

figure(9); imshow(convolvedRed); title('SharpeningconvolvedRed Image');
figure(10); imshow(convolvedGreen); title('SharpeningconvolvedGreen Image');
figure(11); imshow(convolvedBlue); title('SharpeningconvolvedBlue Image');

% Combine the channels back into an RGB image
convolvedImage = uint8(cat(3, convolvedRed, convolvedGreen, convolvedBlue));

% Display the result
figure(12); imshow(convolvedImage); title('SharpeningConvolved Image');
%%%%%%%%%%%
Vertical= [-1 0 1; -1 0 1; -1 0 1]; %Edge Detection Kernel (prewitt filter) 
Horizontal= [-1 -1 -1; 0 0 0; 1 1 1]; %Edge Detection Kernel (prewitt filter) 


convolvedRed = conv2(redChannel, Vertical, 'same');
convolvedGreen = conv2(greenChannel, Vertical, 'same');
convolvedBlue = conv2(blueChannel, Vertical, 'same');

figure(13); imshow(convolvedRed); title('VerticalconvolvedRed Image');
figure(14); imshow(convolvedGreen); title('VerticalconvolvedGreen Image');
figure(15); imshow(convolvedBlue); title('VerticalconvolvedBlue Image');

% Combine the channels back into an RGB image
convolvedImage = uint8(cat(3, convolvedRed, convolvedGreen, convolvedBlue));

% Display the result
figure(16); imshow(convolvedImage); title('VerticalConvolved Image');

%%%%%%%%%
convolvedRed = conv2(redChannel, Horizontal, 'same');
convolvedGreen = conv2(greenChannel, Horizontal, 'same');
convolvedBlue = conv2(blueChannel, Horizontal, 'same');

figure(17); imshow(convolvedRed); title('HorizontalconvolvedRed Image');
figure(18); imshow(convolvedGreen); title('HorizontalconvolvedGreen Image');
figure(19); imshow(convolvedBlue); title('HorizontalconvolvedBlue Image');

% Combine the channels back into an RGB image
convolvedImage = uint8(cat(3, convolvedRed, convolvedGreen, convolvedBlue));

% Display the result
figure(20); imshow(convolvedImage); title('HorizontalConvolved Image');
