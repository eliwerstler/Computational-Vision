function [left right anaglyph] = makeStereogram (dmap, percent)
% [left right anaglyph] = makeStereogram(dmap,percent)
% creates a random-dot stereogram in the output left and right images
% with the input percentage of white dots (specified as a number 
% between 0.0 and 1.0), and with the disparities specified in the 
% input dmap matrix. Also creates a color anaglyph from the left and 
% right images of the stereogram. The output images are the same size 
% as the dmap matrix
[vdim hdim] = size(dmap);
left = zeros(vdim,hdim);        % create initial left and right images
right = zeros(vdim,hdim);
for i = 1:vdim                  % create a pattern of random dots in
    for j = 1:hdim                  % both the left and right images
        if (rand(1) < percent)
            left(i,j) = 1;
        end
        if (rand(1) < percent)
            right(i,j) = 1;
        end
    end
end
for i = 1:vdim                 % place dots from the left image into the
    for j = hdim:-1:1             % right image with a shift in position
        pos = j + dmap(i,j);      % specified by the disparity in dmap
        if (pos >= 1) & (pos <= hdim)
            right(i,pos) = left(i,j);
        end
    end
end
anaglyph = zeros(vdim,hdim,3);
for i = 1:vdim                    % place a red value at all locations with
    for j = 1:hdim                % a white dot in the left image, and a green
        if (left(i,j) == 1)       % value at all locations with a white dot
            anaglyph(i,j,1) = 1;    % in the right image. Locations that
        end                       % have white dots in both images will appear
        if (right(i,j) == 1)      % as yellow (combination of red and green)
            anaglyph(i,j,2) = 1;
        end
    end
end