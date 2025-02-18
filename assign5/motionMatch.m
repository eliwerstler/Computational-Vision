% Eli Werstler
% CSCI 363
% Assignment 5

function [vx vy] = motionMatch (left, right, nsize, range)
left = double(left);			% convert 8-bit (uint8) images to double type
right = double(right);
[rows cols] = size(left);
vx = zeros(rows,cols);         % stores horozontal disparities
vy = zeros(rows,cols);         % stores vertical disparities
% loop through locations in the left image, ignoring image borders because 
% motion matching requires a corresponding patch in the right image for 
% each patch in the left image, and patches near the edges of the image may
% not have corresponding patches in the right image.
for row = range + nsize + 1 : rows - range - nsize
    for col = range + nsize + 1 : cols - range - nsize
        % initialize the minimum difference found to be very large
        minDiff = 1000000000;    
        bestDx = 0;       % corresponding horozontal disparity
        bestDy = 0;       % corresponding vertical disparity
        patch = left(row-nsize : row+nsize,col-nsize : col+nsize); % get left patch
        % loop through all possible horozontal and vertical disparities
        % within range
        for dispx = -range : range
            for dispy = -range : range
                % computes sum of absolute value of difference between
                % patch in left image to corresponding patch in right,
                % shifted by dispx and dispy disparities
                val = sum(sum(abs(patch - right(row+dispy-nsize:dispy+row+nsize, ...
                                         col+dispx-nsize:col+dispx+nsize))));
                % if new patch is a close match, store the new match
                % quality and disparity
                if (val < minDiff)
                minDiff = val;
                bestDx = dispx;
                bestDy = dispy;
                end
            end
        end
        vx(row,col) = bestDx;  % store away the best h and v disparities
        vy(row,col) = bestDy;
    end
end