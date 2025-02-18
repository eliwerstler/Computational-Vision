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
