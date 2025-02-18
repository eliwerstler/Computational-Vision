% script for analyzing the yacht image at two different scales corresponding 
% to Laplacian-of-Gaussian operators with w = 4 and w = 8. 
yacht = imread('yacht.jpg');
imtool(yacht)
lap4 = laplacian(4.0);
conv4 = conv2D(yacht,lap4);
lap8 = laplacian(8.0);
conv8 = conv2D(yacht,lap8);
