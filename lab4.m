% Read the image
clear
clc
close all
%Image Enhancement (contrast adjustment)
A=imread('low_contrast.png');
C=imadjust(A,[0.3 0.7],[0 1]);
figure(42);
imshow(C), title('contrast adjustment for');
B=imadjust(A,[],[],0.2);
figure(43);
imshow(B),title('γ=0.2');
B=imadjust(A,[],[],0.5);
figure(44);
imshow(B),title('γ=0.5');
B=imadjust(A,[],[],0.8);
figure(45);
imshow(B),title('γ=0.8');
B=imadjust(A,[],[],1.2);
figure(46);
imshow(B),title('γ=1.2');
%Image Enhancement (histogram equalization)
figure(47);
imshow(A)
B=histeq(A);
figure(48);
imshow(B),title('histogram equalization for');
figure(49);
imhist(A),title('Histogram - Original');
figure(50);
imhist(B), title('Histogram - Equalized');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Image Enhancement (histogram equalization to each channel)
%imshow(A), title('Original Image');

% Separate the channels
R = A(:, :, 1);
G = A(:, :, 2);
B = A(:, :, 3);

% Apply histogram equalization to each channel
R_eq = histeq(R);
G_eq = histeq(G);
B_eq = histeq(B);

figure(51);
imshow(R_eq), title(' histogram equalization to red channel for');
figure(52);
imshow(G_eq), title(' histogram equalization to green channel for');
figure(53);
imshow(B_eq), title(' histogram equalization to blue channel for');
% Recombine the channels
A_eq = cat(3, R_eq, G_eq, B_eq);

% Display the histogram equalized image
figure(54);
imshow(A_eq), title('Histogram Equalization on Each Channel for');

% Optionally, display histograms of each channel
figure(55);
subplot(3, 2, 1), imhist(R), title('Red Channel Histogram - Original');
subplot(3, 2, 2), imhist(R_eq), title('Red Channel Histogram - Equalized');
subplot(3, 2, 3), imhist(G), title('Green Channel Histogram - Original');
subplot(3, 2, 4), imhist(G_eq), title('Green Channel Histogram - Equalized');
subplot(3, 2, 5), imhist(B), title('Blue Channel Histogram - Original');
subplot(3, 2, 6), imhist(B_eq), title('Blue Channel Histogram - Equalized');
