function nimg2 = rotacao(img)
  [lin,col,~] = size(img);
  nimg = zeros(floor(lin/2),floor(col/2));
  for i = 1:2:lin
    for j = 1:2:col
      nimg(i,j) = img(i,j);
    endfor
  endfor
  nimg2 = zeros(lin, col);
  for i = 1:2:lin
    for j = 1:2:col
      nimg2(i,j) = nimg(i,j);
    endfor
  endfor
  nimg2 = uint8(nimg2);
endfunction;
