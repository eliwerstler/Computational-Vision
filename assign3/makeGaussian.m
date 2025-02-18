function gfilter = makeGaussian(size, sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
gfilter = zeros(size, size);
for i = 1:size
	for j = 1:size
		gfilter(i, j) = 16*exp(-((i-(size+1)/2)^2 + (j - (size+1)/2)^2)/(2*sigma^2));
	end
end

end

