% Eli Werstler
% CSCI 363
% Assignment 5

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