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