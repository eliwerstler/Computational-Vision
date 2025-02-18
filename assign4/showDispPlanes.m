function showDispPlanes (network)
% showDispPlanes(network)
% displays a state of the 3-D network for the cooperative stereo
% algorithm as individual disparity planes 
planes = size(network,3);
m = fix((planes+2)/3);
n = min(planes,3);
for plane = 1:planes
    subplot(m,n,plane), imshow(network(:,:,plane)), title(['disparity plane ' int2str(plane)]);
end