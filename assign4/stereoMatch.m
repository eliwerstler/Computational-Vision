function result = stereoMatch (zcleft, zcright, nsize, range)
% Initializes output to matrix of zeros with the same dimensions as left
% image.
[xdim, ydim] = size(zcleft);
result = double(zeros(xdim,ydim));
maxVal = 0;
maxDisp = 0;
for r = nsize+1:xdim-nsize
    for c = nsize+range+1:ydim-nsize-range
        for disp = -range:range
            % For each pixel and disparity, extracts matching regions in
            % left and right (corresponding to shift in disparity)
            leftPatch = zcleft(r-nsize:r+nsize, c-nsize:c+nsize);
            rightPatch = zcright(r-nsize:r+nsize, c+disp-nsize:c+disp+nsize);
            % Computes similarity between patches through their cross
            % correlation (ranges from -1 to 1).
            value = sum(sum(leftPatch.*rightPatch));
            if(value > maxVal)
                % maxVal shows maximum similarity feature and maxDisp holds
                % the corresponding disparity.
                maxVal = value;
                maxDisp = disp;
            end
        end
        result(r,c) = maxDisp;
        maxVal = 0;
    end
end
% Function returns result matrix representing the disparity map
