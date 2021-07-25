function [mark , classification, length_Images]= geradorImgHuMoments()
  pkg load image; 
  
  %variaveis auxiliares 
  endereco       = 'numbers/'; ext = '*.jpg';
  arquivos       = dir([endereco ext]); 
  quant_img      = length(arquivos); 
  
  vetorEscala = [0.5, 0.75 1 1.25 1.5 1.75 2];
  vetorAngulo = [45 60 90 85 180 260 55 120 30 20 15 200 19 25 55 69 268 265 185];
  vetorRuido = [0 0.01 0.02 0.03 0.04]; 
  
  length_Images = quant_img*length(vetorAngulo)*length(vetorEscala)*length(vetorRuido);
  
  mark = zeros(length_Images, 7);
  classification = zeros(length_Images,1);
  cont = 1;
  
 %for para percorrer as 9 imagens originais 
  for i = 1 : quant_img
    %leitura da imagem 
    img = imread([endereco, arquivos(i, 1).name]);
    nimg = img; 
    for j = 0 : length(vetorAngulo) - 1
      %geração da rotação na imagem em diferentes angulos 
      nimg = imrotate(img, vetorAngulo(j+1), 'nearest', 'crop');
     for k = 1 : length(vetorEscala)
        %geração da redução da imagem em diferentes escalas - geração de 7 imagens diferentes
        nimgE = imresize(nimg, vetorEscala(k));
        for m = 1 : length(vetorRuido)
          %inserção do ruido salt & pepper na imagem - para cada imagem de escala gerado
          nimgR = imnoise(nimgE, 'salt & pepper',vetorRuido(m));
          num = num2str(i, '%d');
          rot = num2str(j, '%d');
          resize = num2str(k,'%d');
          name = strcat(num, rot);
          name = strcat(name,resize);
          name = strcat(name, '.jpg'); name = strcat('numbers/numbers/', name);  
          imwrite(nimgR, name); 
          %hu moments 
          mark(cont, :) = humoments(nimgR);
          classification(cont) = i -1;
          cont = cont + 1; 

        endfor
     endfor   
    endfor
  endfor
  disp('Geração de imgens concluida e HU');
 endfunction