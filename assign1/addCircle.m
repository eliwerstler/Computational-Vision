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