function result = e8()
  [modelo, ~] = central();
  
  img = imread('numeros2.jpg');
  figs = BoundingBoxPatches(img); 
  
  [linha, ~] = size(figs);
  
  for i = 1 : linha
    figures_Hu = humoments(figs{i});
    
    result = test_sc(modelo, figures_Hu); 
    
  endfor
  disp('Classificação concluida'); 
endfunction
