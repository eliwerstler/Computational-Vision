% Eli Werstler
% CSCI 363
% Assignment 2

% script for analyzing the sun illusion at a single scale corresponding to a 
% Laplacian-of-Gaussian operator with w = 5, 10, and 20
sun = makeSun;          % create and display an image of 
imtool(sun)                % the sun illusion
% convolve the image with a Laplacian-of-Gaussian operator with
% w = 5,10,20 and scale down the values
lap5 = laplacian(5.0);
lap10 = laplacian(10.0);
lap20 = laplacian(20.0);
convSun5 = 0.1*conv2D(sun,lap5);
convSun10 = 0.1*conv2D(sun,lap10);
convSun20 = 0.1*conv2D(sun,lap20);
% compute the zero-crossings and view the result
zcSun5 = zcs(convSun5);
displayImage(zcSun5, 10)
zcSun10 = zcs(convSun10);
displayImage(zcSun10, 10)
zcSun20 = zcs(convSun20);
displayImage(zcSun20, 10)