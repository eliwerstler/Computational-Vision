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