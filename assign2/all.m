% Eli Werstler
% CSCI 363
% Assignment 2
function zcImage = zcs(conv)
[x,y] = size(conv);
zcImage = zeros(x,y);
for i = 2:x
    for j = 2:y
        if ((conv(i,j) * conv(i-1,j)) < 0) || ((conv(i,j) * conv(i,j-1)) < 0)
            zcImage(i,j) = 255;
        end
    end
end
end

function zcSlope = zeros2D(conv)
[x,y] = size(conv);
zcSlope = uint8(zeros(x,y));
for i = 2:x-1
    for j = 2:y-1
        dx = conv(i,j) - conv(i-1,j);
        dy = conv(i,j) - conv(i,j-1);
        slope = round(sqrt((dx*dx) + (dy*dy)));
        if ((conv(i,j) * conv(i-1,j)) < 0) || ((conv(i,j) * conv(i,j-1)) < 0)
            zcSlope(i,j) = slope;
        end
    end
end
end

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

% Discussion Log: I worked alone on this project