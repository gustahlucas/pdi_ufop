function nimg = notch(img, d0)    
  [lin, col] = size(img);
  u0 = (lin / 2 - 88);
  v0 = (col / 2 - 88);
  
  d1 = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      d1(i, j) = sqrt((i - lin / 2 - u0) ^ 2 + (j - col / 2 - v0) ^ 2);
    end
  end
  
  d2 = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      d2(i, j) = sqrt((i - lin / 2 + u0) ^ 2 + (j - col / 2 + v0) ^ 2);
    end
  end
  
  h = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      h(i, j) = 1 - exp((-1 / 2) * ((d1(i, j) * d2(i, j)) / (d0 ^ 2)));
    end
  end
  
  nimg = h .* fftshift(fft2(img));
  nimg = abs(ifft2(nimg));
end