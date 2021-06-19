function nimg = luminancia (img)
  img = double (img);
  R = img(:,:,1);
  G = img(:,:,2);
  B = img(:,:,3);
  for i = 1:100
    nimg = 0.299*R+0.587*G+0.114*B;
    nimg = uint8(nimg);
  endfor; 
 endfunction;
