% script for analyzing the Hermann grid image. The original image, convolution 
% result and zero-crossings are displayed in three separate Image Tool windows
% and can be dragged apart
hermann = makeHermann;          % create and display a
imtool(hermann)                 % Hermann grid image
% convolve the image with a Laplacian-of-Gaussian operator with
% w = 6 (the width of the white bars) and scale down the values
lap6 = laplacian(6.0);
convHerm = 0.1*conv2D(hermann,lap6);
displayImage(convHerm, 12)      % view the convolution
% compute the zero-crossings and view the result
zcHerm = zeros2D(convHerm);
displayImage(zcHerm, 12)