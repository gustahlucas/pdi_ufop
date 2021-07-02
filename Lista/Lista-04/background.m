function nimg = background(img1, img2, inc)
  nimg = cat (3, img1, img1, img1);
  for i = 1 : size(nimg, 1)
    for j = 1 : size(nimg, 2)
      if img2 (i, j) == 0
        nimg(i,j,1) = nimg(i,j) * inc;
        nimg(i,j,2) = nimg(i,j) * inc;
        nimg(i,j,3) = nimg(i,j) * inc * 2;
      endif
    endfor
  endfor
endfunction