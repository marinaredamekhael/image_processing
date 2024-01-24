clear
clc
close all
img = imread('land.jpg')/256;
% Separate the color channels
redChannel = img(:, :, 1);
greenChannel = img(:, :, 2);
blueChannel = img(:, :, 3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define thresholds
lowThresh = 0.05; % Lower threshold
highThresh = 0.9; % Higher threshold

% Apply edge detection to each color channel
edgeRedLow = edge(redChannel, 'Canny', lowThresh);
edgeGreenLow = edge(greenChannel, 'Canny', lowThresh);
edgeBlueLow = edge(blueChannel, 'Canny', lowThresh);

figure(21); imshow(edgeRedLow); title('CannyedgeRedLow ImagelowThresh ');
figure(22); imshow(edgeGreenLow); title('edgeGreenLow ImagelowThresh');
figure(23); imshow(edgeBlueLow); title('edgeBlueLow ImagelowThresh');

edgeRedHigh = edge(redChannel, 'Canny', highThresh);
edgeGreenHigh = edge(greenChannel, 'Canny', highThresh);
edgeBlueHigh = edge(blueChannel, 'Canny', highThresh);

figure(24); imshow(edgeRedHigh); title('CannyedgeRedHigh ImagehighThresh');
figure(25); imshow(edgeGreenHigh); title('CannyedgeGreenHigh ImagehighThresh');
figure(26); imshow(edgeBlueHigh); title('CannyedgeBlueHigh ImagehighThresh');

% Display results for low threshold in a single line
figure(27); imshow(cat(3, uint8(255 * edgeRedLow), uint8(255 * edgeGreenLow), uint8(255 * edgeBlueLow))); title('Edges with Low Threshold');

% Display results for high threshold in a single line
figure(28); imshow(cat(3, uint8(255 * edgeRedHigh), uint8(255 * edgeGreenHigh), uint8(255 * edgeBlueHigh))); title('Edges with High Threshold');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read and prepare the image
A = imread('land.jpg');
[ms, ns, ~] = size(A);

% Ensure the image dimensions are multiples of 8
ms = ms - mod(ms, 8);
ns = ns - mod(ns, 8);
A = A(1:ms, 1:ns, :);

% Define the compression matrix 1:64
C = [1 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];

B = zeros(ms, ns, 3); % DCT coefficients
D = zeros(ms, ns, 3); % Reconstructed image

for k = 1:3 % For each color channel
    for i = 1:8:ms
        for j = 1:8:ns
            block = dct2(A(i:i+7, j:j+7, k));
            B(i:i+7, j:j+7, k) = C .* block;
            D(i:i+7, j:j+7, k) = idct2(B(i:i+7, j:j+7, k));
        end
    end
end
D=D/256;
% Display the images
figure(29); imshow(A); title('Original Image');
figure(30); imshow(log(abs(B)), []); title('1:64 DCT Coefficients');
figure(31); imshow(D, []); title('1:64 Reconstructed Image');

% Define the compression matrix 3:64
C = [1 1 0 0 0 0 0 0; 1 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];

B = zeros(ms, ns, 3); % DCT coefficients
D = zeros(ms, ns, 3); % Reconstructed image

for k = 1:3 % For each color channel
    for i = 1:8:ms
        for j = 1:8:ns
            block = dct2(A(i:i+7, j:j+7, k));
            B(i:i+7, j:j+7, k) = C .* block;
            D(i:i+7, j:j+7, k) = idct2(B(i:i+7, j:j+7, k));
        end
    end
end
D=D/256;
% Display the images
figure(32); imshow(log(abs(B)), []); title('3:64 DCT Coefficients');
figure(33); imshow(D, []); title('3:64 Reconstructed Image');

% Define the compression matrix 6:64
C = [1 1 1 0 0 0 0 0; 1 1 0 0 0 0 0 0; 1 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];

B = zeros(ms, ns, 3); % DCT coefficients
D = zeros(ms, ns, 3); % Reconstructed image

for k = 1:3 % For each color channel
    for i = 1:8:ms
        for j = 1:8:ns
            block = dct2(A(i:i+7, j:j+7, k));
            B(i:i+7, j:j+7, k) = C .* block;
            D(i:i+7, j:j+7, k) = idct2(B(i:i+7, j:j+7, k));
        end
    end
end
D=D/256;
% Display the images
figure(34); imshow(log(abs(B)), []); title('6:64 DCT Coefficients');
figure(35); imshow(D, []); title('6:64 Reconstructed Image');


% Define the compression matrix 10:64
C = [1 1 1 1 0 0 0 0; 1 1 1 0 0 0 0 0; 1 1 0 0 0 0 0 0; 1 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];

B = zeros(ms, ns, 3); % DCT coefficients
D = zeros(ms, ns, 3); % Reconstructed image

for k = 1:3 % For each color channel
    for i = 1:8:ms
        for j = 1:8:ns
            block = dct2(A(i:i+7, j:j+7, k));
            B(i:i+7, j:j+7, k) = C .* block;
            D(i:i+7, j:j+7, k) = idct2(B(i:i+7, j:j+7, k));
        end
    end
end
D=D/256;
% Display the images
figure(36); imshow(log(abs(B)), []); title('10:64 DCT Coefficients');
figure(37); imshow(D, []); title('10:64 Reconstructed Image');

% Define the compression matrix 15:64
C = [1 1 1 1 1 0 0 0; 1 1 1 1 0 0 0 0; 1 1 1 0 0 0 0 0; 1 1 0 0 0 0 0 0; 1 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];

B = zeros(ms, ns, 3); % DCT coefficients
D = zeros(ms, ns, 3); % Reconstructed image

for k = 1:3 % For each color channel
    for i = 1:8:ms
        for j = 1:8:ns
            block = dct2(A(i:i+7, j:j+7, k));
            B(i:i+7, j:j+7, k) = C .* block;
            D(i:i+7, j:j+7, k) = idct2(B(i:i+7, j:j+7, k));
        end
    end
end
D=D/256;
% Display the images
figure(38); imshow(log(abs(B)), []); title('15:64 DCT Coefficients');
figure(39); imshow(D, []); title('15:64 Reconstructed Image');
