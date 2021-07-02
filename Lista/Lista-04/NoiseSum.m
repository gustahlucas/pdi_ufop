function [nimg , figs] = NoiseSum (img, n)
  nimg = zeros(size(img));
  figs = cell(1,n);
  for i = 1 : n
    figs{i} = imnoise (img, "gaussian");
    nimg = nimg + double(figs{i});
  endfor
  sort(nimg,3);
  nimg = uint8(nimg/((n/2)+1));
endfunction;