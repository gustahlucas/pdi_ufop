function nimg = translacao(img, v, h)
  [lin, col, ~] = size(img);
  nimg = zeros(lin, col);
  sLin = 1; eLin = lin; iLin = 1;
  sCol = 1; eCol = col; iCol = 1;
  if v > 0
    sCol = col; eCol = 1; iCol = -1;
  endif
  if h < 0
    sLin = lin; eLin = 1; iLin = -1;
  endif
  for i = sLin : iLin : eLin
    for j = sCol : iCol : eCol
      if i-h >= 1 && i-h <= lin && j+v >= 1 && j+v <= col
          nimg(i-h, j+v) = img(i, j);  
      endif
    endfor
  endfor
  nimg = uint8(nimg);
 endfunction;