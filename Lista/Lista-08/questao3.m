function questao3 (img, operacao)
  
  elemenEstrut = strel('diamond', 1);
  
  switch operacao
    case 'a'
      nimg = double(img) .* ~imerode(img, elemenEstrut);
      imwrite(nimg, "bordas-internas.png");

    case 'b'
      nimg = double(imdilate(img, elemenEstrut)) .* ~img;
      imwrite(nimg, "bordas-externas.png");
    case 'c'
      nimg = (double(imdilate(img,elemenEstrut)) .* ~imerode(img,elemenEstrut));
      imwrite(nimg, "gradiente-morfologico.png");

  endswitch
endfunction