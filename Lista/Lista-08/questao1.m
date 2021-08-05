function questao1()
  img     = imread('coins.png');
  x       = rand(size(img));
  d1      = find(x <= 0.05);
  d2      = find(x >= 0.95);
  img(d1) = 0;
  img(d2) = 1;
  
  sp = ones(3);
  sk = [0 1 0; 1 1 1; 0 1 0];
  
  abertura = imdilate(imerode(img,sk),sk);
  fecho    = imerode(imdilate(abertura, sk), sk);
  
  imwrite(fecho, 'questao1.png');
  
endfunction
  