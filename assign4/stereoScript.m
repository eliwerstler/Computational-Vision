% script for creating sample stereograms and running the Marr-Poggio
% cooperative stereo algorithm

% first create a disparity map consisting of concentric circles with
% disparities ranging from 0 to 3
dmapCake = makeCake(1);
% create a 50% random-dot stereogram from this disparity map
[leftC rightC anaglyphC] = makeStereogram(dmapCake,0.5);
showStereogram(leftC,rightC);   % display stereogram
figure, imshow(anaglyphC);
% run 5 iterations of the cooperative stereo algorithm
% and display final state of the network as a gray-level image
final_netC = coopStereo(leftC,rightC,0,3,5);
showNetwork(final_netC);
