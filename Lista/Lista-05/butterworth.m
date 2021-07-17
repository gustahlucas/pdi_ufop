function nimg = butterworth(img, d0, w, n)    
  [lin, col] = size(img);
  
  d = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      d(i, j) = sqrt(lin^ 2 + col^ 2);
    end
  end
 
  h = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      h(i, j) = 1 / 1 +((d(i, j) * w)/(d(i, j) ^2 - d0 ^ 2))^(2*n);
    end
  end
  
  nimg = h .* fftshift(fft2(img));
  nimg = abs(ifft2(nimg));
end