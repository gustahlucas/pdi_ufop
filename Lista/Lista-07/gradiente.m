function gradiente()
  t1 = imread('coins.png');
  t1 = uint8(t1);
  t1 = rgb2gray(t1);
  
  [lin, col] = size(t1);
  [x, y] = meshgrid(1:lin, 1:col);
  t2 = double(t1).*((x+y)/2 + 64)+x+y;
  t3 = uint8(255*mat2gray(t2));
  imwrite(t3, 'gradiente.png');
 
endfunction