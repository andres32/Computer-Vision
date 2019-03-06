im = imread('lion.png');    %read image from the folder
theta = 20/180*pi;          %the angle theta
R =  [cos(theta) -sin(theta); sin(theta) cos(theta)];   %rotation matrix   
p = [size(im,2)/2;size(im,1)/2];    %axis x, and y of the image
T = [R -R*p+p;0 0 1];       %transforamtim matrix
im_warped = ImageWarpingEuclidean(im, T);


