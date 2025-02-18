function [minv, maxv] = getRange(image, border)
% [minv maxv] = getRange(image, border)
% returns the minimum and maximum values in a central region of the input
% 1D or 2D image that excludes a border around the outer edge of the image
[xdim ydim] = size(image);
% determine region where min and max should be calculated
if (xdim > 1)
    xstart = border+1;
    xlim = xdim-border;
end
if (ydim > 1)
    ystart = border+1;
    ylim = ydim-border;
end
if (xdim > 1) && (ydim > 1)     % 2D matrix
    region = image(xstart:xlim, ystart:ylim);
    minv = min(min(region));
    maxv = max(max(region));
elseif (xdim == 1)              % 1D row vector
    minv = min(image(ystart:ylim));
    maxv = max(image(ystart:ylim));
else                            % 1D column vector
    minv = min(image(xstart:xlim));
    maxv = max(image(xstart:xlim));
end