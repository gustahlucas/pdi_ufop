function nimg = escalamento(img , x, y)
  [col, lin, ~] = size(img);
  nCol = col * x;
  nLin = lin * y;
  
  lInt = ceil([1:(size(img,1)*y)]./(y));
  cInt = ceil([1:(size(img,2)*x)]./(x));
  d = double(img);
  
  aux = d(:,:,1);
  R = aux(lInt, :);
  R = R(:, cInt);
  
  aux = d(:, :, 2);
  G = aux(lInt, :);
  G = G(:, cInt); 
  aux = d(:, :, 3);
  
  B = aux(lInt, :);
  B = B(:, cInt); 
  
  nimg = zeros([nLin, nCol, 3]);
  nimg(:, :, 1) = R;
  nimg(:, :, 2) = G;
  nimg(:, :, 3) = B;
  
  nimg = uint8(nimg);
 endfunction;