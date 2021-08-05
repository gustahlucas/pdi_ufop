function questao2 (img)
  old   = zeros(size(img));
  new   = old;
  coord = [85 60;50 90;50 125;45 200;150 30;200 125;200 210;200 240; 170 260];
  
  for i=1:9
        x = coord(i,1);
        y = coord(i,2);
        new(x,y) = 1;
        elemEstrut = strel('diamond',1);
        while ~isequal(new, old)
            old = new;
            new = imdilate(old, elemEstrut) .* ~img;
        end
    end
   imwrite(new , 'questao2.png');
endfunction