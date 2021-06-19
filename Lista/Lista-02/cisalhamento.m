function nimg = cisalhamento(img, x, y)
  [lin, col, ~] = size(img);
  nimg = zeros(lin*2, col*2);
  
  for i = 1:lin
    for j = 1:col
      if j+y > 0
        nimg(i, j+y) = img (i,j);
      endif
      y = y + 1;
    endfor
  endfor
  
  nimg = uint8(nimg);
  imshow(nimg);
endfunction;