function hermann = makeHermann
% hermann = makeHermann
% creates a 200x200 image of the Hermann grid with white bars
% having a width of 6 pixels 
hermann = uint8(5*ones(200,200));
for i = 1:200
    for j = 1:200
        if (((rem(i,40)<6) && (i>5)) || ...
                ((rem(j,40)<6) && (j>5)))
            hermann(i,j) = 255;
        end
    end
end