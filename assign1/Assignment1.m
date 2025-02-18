% Eli Werstler
% 2/9/2023
% Assignment 1
% Prof. Royden

function newImage = addCircle(image, xcenter, ycenter, radius, intensity)
% copies contents of input matrix into new Image
newImage = image;
for i = ycenter - radius : ycenter + radius
    ylength = ycenter - i;
    % Length accross circle at given y value, using pythagorean theorem
    xlength = round(sqrt((radius*radius) - (ylength*ylength)));
    for j = xcenter - xlength : xcenter + xlength
        newImage(i, j) = intensity;
    end
end
end

function colorImage = addColorCircle(image, xcenter, ycenter, radius, r, g, b)
% copies contents of input matrix into new Image
colorImage = image;
for i = ycenter - radius : ycenter + radius
    ylength = ycenter - i;
    % Length accross circle at given y value, using pythagorean theorem
    xlength = round(sqrt((radius*radius) - (ylength*ylength)));
    for j = xcenter - xlength : xcenter + xlength
        % Colors pixel with inputted r, g, and b values
        colorImage(i, j, 1) = r;
        colorImage(i, j, 2) = g;
        colorImage(i, j, 3) = b;
    end
end
end

function newImage = blurImage(image, nsize)
newImage = image;
% Copies dimensions of image into x and y
[x,y] = size(image);
for i = 1 + nsize : x - nsize
    for j = 1 + nsize : y - nsize
        % Creates new matrix of values around pixel to be averaged
        A = image(i-nsize : i+nsize, j-nsize : j+nsize);
        % replaces pixel with average of matrix
        newImage(i, j) = round(sum(sum(A)) / (4*(nsize*nsize)));
    end
end
end

function newImage = findEdges(image)
% Copies dimensions of image into x and y
[x,y] = size(image);
% Creates new image entirely black
newImage = zeros(x,y);
for i = 2 : x-1
    for j = 2: y-1
        % If pixel is different from adjacent pixels, changes to white
        if image(i,j) ~= image(i-1,j) || image(i,j) ~= image(i,j-1) || image(i,j) ~= image(i+1,j) || image(i,j) ~= image(i,j+1)
            newImage(i,j) = 255;
        end
    end
end
end

% Discussion Log: I worked with Lauren Chilton on some of problem 2 and 3