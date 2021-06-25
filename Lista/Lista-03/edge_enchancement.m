function myimg = edge_enchancement(img)
  [x y] = size(img);
  myimg = zeros(x,y);
  for i=2:1:x-1
    for j=2:1:y-1
      myimg(i+1,j+1) = img(i,j);
    endfor
  endfor
  myimg = abs(img - myimg);
 endfunction