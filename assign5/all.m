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

% px, py, vp are matrices representing spatial and temporal derivatives of
% image. step is the step size for iterating accross image. vlim is the
% velocity threshold for filtering out noise
function [vx vy] = computeVelocity (px, py, vp, nsize, step, vlim)

[r,c] = size(px);
vx = zeros(r,c);
vy = zeros(r,c);

% loops through pixels of image, besides the edges
for x = nsize + 1 : step : r - nsize - 1
    for y = nsize + 1 : step : c - nsize - 1
        % initializes valiables used for computing velocity: coefficients
        % of the system of equations
        a1 = 0;
        a2 = 0;
        b1 = 0;
        b2 = 0;
        c1 = 0;
        c2 = 0;
        v1 = 0;
        v2 = 0;
        % loops through pixels around current pixel, computing velocity
        % vectors
        for i = x - nsize : x + nsize
            for j = y - nsize : y + nsize
                a1 = a1 + px(i,j) * px(i,j);
                a2 = a2 + px(i,j) * py(i,j);
                b1 = a2 + px(i,j) * py(i,j);
                b2 = b2 + py(i,j) * py(i,j);
                c1 = c1 + vp(i,j) * px(i,j);
                c2 = c2 + vp(i,j) * py(i,j);
                
                % estimated velocity components in x and y directions
                v1 = (c1 * b2 - b1 * c2) / (a1 * b2 - a2 * b1);
                v2 = (a1 * c2 - a2 * c1) / (a1 * b2 - a2 * b1);
            end
        end
        
        % checks if velocity is below threshold; if so, components are
        % stored in output matrices at current pixel (discarded otherwise)
        if(abs(v1) < vlim && abs(v2) < vlim)
            vx(x,y) = v1;
            vy(x,y) = v2;
        end
    end
end
end