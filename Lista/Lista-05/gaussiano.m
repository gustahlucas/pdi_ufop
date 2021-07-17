function nimg = gaussiano(img, d0, w)    
  [lin, col] = size(img);
  d = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      d(i, j) = sqrt(lin.^ 2 + col.^ 2);
    end
  end
 
  h = zeros(lin, col);
  for i = 1 : lin
    for j = 1 : col
      h(i, j) = 1 - exp(-((d(i, j) ^ 2 - d0 ^ 2)/(d(i, j)*w))^2);
    end
  end
  
  nimg = h .* fftshift(fft2(img));
  nimg = abs(ifft2(nimg));
  %imshow(log(abs(nimg)+1),[]);
end