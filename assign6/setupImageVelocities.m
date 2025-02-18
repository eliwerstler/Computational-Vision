% Eli Werstler
% CSCI 363
% Assignment 6

function [vx, vy, xfoe, yfoe] = setupImageVelocities(Tx, Ty, Tz, Rx, Ry, Rz, zmap)
    [r, c] = size(zmap);
    
    % center of image
    icenter = (r)/2;
    jcenter = (c)/2;
    
    % 2D grid for each pixel
    vx = zeros(r, c);
    vy = zeros(r, c);
    
    for i = 1:r
        for j = 1:c
            % displacements of each pixel from center, interms of number of pixels
            % and scaled by 0.05
            x = 0.05*(i - icenter);
            y = 0.05*(j - jcenter);
            
            Z = zmap(i, j);
            % components of optical flow vectors for each pixel
            vx(i, j) = (-Tx + x*Tz)/Z + Rx*x*y - Ry*(x^2 + 1) + Rz*y;
            vy(i, j) = (-Ty + y*Tz)/Z + Rx*(y^2 + 1) - Ry*x*y - Rz*x;
        end
    end
    
    xfoe = 1000.0;
    yfoe = 1000.0;
    if Tz ~= 0
        % calculates coordinates of FOE
        xfoe = Tx/Tz;
        yfoe = Ty/Tz;
    end
end