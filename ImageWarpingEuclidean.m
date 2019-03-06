function im_warped = ImageWarpingEuclidean(im, H)

im = double(im);

H = inv(H);

[v_x, v_y] = meshgrid(1:(size(im,2)),1:(size(im,1)));

h = size(v_x,1);
w = size(v_x,2);

u_x = H(1,1)*v_x+H(1,2)*v_y+H(1,3);
u_y = H(2,1)*v_x+H(2,2)*v_y+H(2,3); 

im_warped(:,:,1) = reshape(interp2(im(:,:,1),u_x(:),u_y(:)),[h, w]);
im_warped(:,:,2) = reshape(interp2(im(:,:,2),u_x(:),u_y(:)),[h, w]);
im_warped(:,:,3) = reshape(interp2(im(:,:,3),u_x(:),u_y(:)),[h, w]);

im_warped = uint8(im_warped);
img = imshow(im_warped);
